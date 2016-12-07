class FavorsController < ApplicationController
  before_action :set_favor, only: [:show, :edit, :update, :destroy]
  #before_filter :authorize_owner, only: [:edit, :create, :new, :update, :destroy]
  before_action :verificar_estado, only: [:destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]


  # GET /favors
  # GET /favors.json
  def index
    Visit.create
    @favors = Favor.where(:estado=> 'activo').order('created_at DESC').all
  end

  def verificar_estado
    if (@favor.estado != 'activo')
      redirect_to root_url, alert: "Solo podes cancelar favores activos"
    end
  end
  # GET /favors/1
  # GET /favors/1.json
  def buscar
    @favors = Favor.buscar(params[:busqueda]).order('created_at DESC').all
    render action: :index
  end

  # def titulo_descripcion
  #   @favors = Favor.titulo_descripcion(params[:busqueda]).order('created_at DESC').all
  #   render action: :index
  # end

  def show
  end

  # GET /favors/new
  def new
    if user_signed_in?
      if current_user.puntos > 0
        @favor = Favor.new
      else
        redirect_to (root_path), error: "No tienes suficientes puntos."
        flash[:notice] = "No tienes suficientes puntos para pedir una gauchada"
      end
    else
      redirect_to (root_path), error: "Debe iniciar sesion o registrarse"
    end
  end

  # GET /favors/1/edit
  def edit
    if !user_signed_in?
      redirect_to (root_path), error: "Debe iniciar sesion o registrarse"
      flash[:notice] = "Debe iniciar sesion o registrarse"
    elsif current_user.id != @favor.user_id
      redirect_to (root_path), error: "No tenes permiso."
      flash[:notice] = "No tenes permiso."
    end
  end
  # POST /favors
  # POST /favors.json
  def create
    @favor = current_user.favors.build(favor_params)
    respond_to do |format|
      if @favor.save
        format.html { redirect_to @favor, notice: 'Favor creado con exito.' }
        format.json { render :show, status: :created, location: @favor }
        current_user.puntos=current_user.puntos-1
        current_user.save
      else
        format.html { render :new }
        format.json { render json: @favor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favors/1
  # PATCH/PUT /favors/1.json
  def update
    respond_to do |format|
      if @favor.update(favor_params)
        format.html { redirect_to @favor, notice: 'Favor actualizado con exito.' }
        format.json { render :show, status: :ok, location: @favor }
      else
        format.html { render :edit }
        format.json { render json: @favor.errors, status: :unprocessable_entity }
      end
    end
  end

  def eliminar
    @favor = Favor.find(params[:favor_id])
    if (current_user.admi n?)
      @favor.destroy
    else
      redirect_to (root_path), error: "No tenes permiso."
    end
  end
  # DELETE /favors/1
  # DELETE /favors/1.json
  def destroy
    if user_signed_in?
      if current_user.id == @favor.user_id
        @favor.update_attribute(:estado, "cancelado")
        respond_to do |format|
            format.html { redirect_to favors_url, notice: 'Favor cancelado con exito.' }
            format.json { head :no_content }
        end
      else
        redirect_to (root_path), error: "No tenes permiso."
        flash[:notice] = "No tenes permiso."
      end
    else
      redirect_to (root_path), error: "Debes iniciar sesion o registrarte"
      flash[:notice] = "Debes iniciar sesion o registrarte"
    end
  end

  def eliminar
    if user_signed_in?
      if current_user.admin?
        @favor = Favor.find(params[:favor_id])
        @favor.destroy
        respond_to do |format|
         format.html { redirect_to root_path, notice: 'Se ha borrado el favor correctamente.' }
         format.json { head :no_content }
        end
      end
    end
  end

  def reabrir
    if user_signed_in?
      if current_user.id == @favor.user_id
        @favor = Favor.find(params[:id])
        if (@favor.estado=="rechazado")
          @favor.estado="activo"
          @favor.postulacion_id=nil
          @favor.save
          if !(@favor.postulations.nil?)
             @favor.postulations.delete_all
          end
          redirect_to (favor_path(@favor.id))
          flash[:notice] = "Has reabrierto el favor"
        else
          flash[:notice] = "Solo se pueden reabrir favores que no se resolvieron bien"
        end
      else
        redirect_to (root_path)
        flash[:notice] = "No tenes permiso"
      end
    else
      redirect_to (root_path)
      flash[:notice] = "Debes iniciar sesion o registrarte"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favor
      @favor = Favor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favor_params
      params.require(:favor).permit(:descripcion, :lugar, :titulo, :imagen, :fecha)
    end
end
