class FavorsController < ApplicationController
  before_action :set_favor, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_owner, only: [:edit, :create, :new, :update, :destroyu]


  # GET /favors
  # GET /favors.json
  def index
    @favors = Favor.order('created_at DESC').all
  end

  # GET /favors/1
  # GET /favors/1.json
  def show
  end

  # GET /favors/new
  def new
    @favor = Favor.new
  end

  # GET /favors/1/edit
  def edit

  end

  # POST /favors
  # POST /favors.json
  def create
    @favor = Favor.new(favor_params)
    @favor.user_id = current_user.id
    respond_to do |format|
      if @favor.save
        format.html { redirect_to @favor, notice: 'Favor creado con exito.' }
        format.json { render :show, status: :created, location: @favor }
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

  # DELETE /favors/1
  # DELETE /favors/1.json
  def destroy
    @favor = current_user.favors.find(params[:id])
    @favor.destroy
    respond_to do |format|
      format.html { redirect_to favors_url, notice: 'Favor eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favor
      @favor = Favor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favor_params
      params.require(:favor).permit(:descripcion, :lugar, :titulo, :imagen)
    end
end
