class EstadisticasController < ApplicationController
before_filter :authorize_admin, only: [:index, :show, :new, :edit, :create]

def favores_resueltos
	
end

def visitas
	
end

def ganancias
	@compras = Compra.all
end

end