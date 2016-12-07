class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :update, :new]

  def fechas
    total=0
    ini = params["inicial"].map{|k,v| v}.join("-").to_date
    fin = params["final"].map{|k,v| v}.join("-").to_date
    if (ini > fin)
      redirect_to ganancias_estadisticas_path, notice: "La fecha inicial no puede ser mayor que la final"
    else
      @compras = Compra.all
      @compras.each do |c|
      creado = c.created_at.to_date
      if creado > ini and creado < fin
        total= total + c.monto
      end
    end
    redirect_to ganancias_estadisticas_path, notice: "La ganancia total entre las fechas "+ ini.to_formatted_s + " y " + fin.to_formatted_s + " es de $"+total.to_s
    return
  end
end
  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
    @compra = Compra.last
  end

  # GET /compras/new
  def new
    if user_signed_in?
        @compra = Compra.new
    else
      redirect_to (root_path), error: "No tenes permiso."
    end
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
        @compra = current_user.compras.build(compra_params)
        if (@compra.puntos != nil)
          if @compra.valid?
            @compra.user.update_attribute(:puntos, @compra.user.puntos += @compra.puntos)
            @compra.monto = @compra.puntos * Precio.first.valor
        end
      end

      if @compra.save
        respond_to do |format|
          format.html { redirect_to @compra, notice: 'Ha comprado puntos exitosamente.' }
          format.json { render :show, status: :created, location: @compra }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @compra.errors, status: :unprocessable_entity }
        end
    end

  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'Ha comprado puntos exitosamente.' }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Su compra ha sido cancelada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
    #  @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:puntos, :tarjeta, :code, :vencimiento, :name, :user_id, :inicial, :final)
    end
end
