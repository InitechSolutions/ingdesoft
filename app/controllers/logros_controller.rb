class LogrosController < ApplicationController
  before_action :set_logro, only: [:show, :edit, :update, :destroy]

  # GET /logros
  # GET /logros.json
  def index
    @logros = Logro.order(min: :asc).all
  end

  # GET /logros/1
  # GET /logros/1.json
  def show
  end

  # GET /logros/new
  def new
    @logro = Logro.new
  end

  # GET /logros/1/edit
  def edit

  end

  # POST /logros
  # POST /logros.json
  def create
    @logro = Logro.new(logro_params)

    respond_to do |format|
      if @logro.save
        format.html { redirect_to @logro, :notice => 'El logro ha '+ @logro.nombre + ' sido creado.' }
        format.json { render :show, status: :created, location: @logro }
      else
        format.html { render :new }
        format.json { render json: @logro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logros/1
  # PATCH/PUT /logros/1.json
  def update
    respond_to do |format|
      if @logro.update(logro_params)
        format.html { redirect_to @logro, :notice => 'El logro '+ @logro.nombre + '  ha sido editado.' }
        format.json { render :show, status: :ok, location: @logro }
      else
        format.html { render :edit }
        format.json { render json: @logro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logros/1
  # DELETE /logros/1.json
  def destroy
     @logro = Logro.find(params[:id])
    if @logro == @logro.primero
      respond_to do |format|
      format.html { redirect_to logros_url, :notice =>'El primer logro no se puede eliminar.' }
      format.json { head :no_content }
    end
    else
     @logro.anterior.update_attribute(:max, @logro.max)
     @logro.destroy
     respond_to do |format|
      format.html { redirect_to logros_url, :notice =>'El logro '+@logro.nombre+' ha sido eliminado.' }
      format.json { head :no_content }
    end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logro
      @logro = Logro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logro_params
      params.require(:logro).permit(:nombre, :min, :max)
    end


end
