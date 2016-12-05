class PostulationsController < ApplicationController
before_action :verificar_estado_favor, only: [:new]
before_action :verificar_elegido, only: [:elegir]
before_action :autorizado, only: [:show]


def verificar_estado_favor
	if (Postulation.where(:favor_id => params[:favor_id]).where(:estado => "seleccionado").exists?)
		redirect_to root_url, alert: "No puedes postularte ya que este favor esta siendo realizado por otra persona"
	end
end
def autorizado
    if current_user.id != Favor.where(:id => params[:id]).first.user_id
  		redirect_to root_url, alert: "Acceso limitado solo al dueño del favor"
  	end
end

  def verificar_elegido
  	if (Postulation.where(:favor_id => params[:favor_id]).where(:estado => "seleccionado").exists?)
  		redirect_to root_url, alert: "Ya has seleccionado un postulante para realizar el favor previamente"
  	end
  end
  def index
  end

  def new
  		@postulation = Postulation.new
  end
  def create
  	@postulation = current_user.postulations.build(postulation_params)
  	@postulation.estado = 'pendiente'
  	if @postulation.save
  		redirect_to Favor.find(@postulation.favor_id) , :notice => 'Te has postulado para realizar el siguiente favor.'
  	else
      flash[:alert] = @postulation.errors.full_messages.to_sentence
      redirect_to root_path
	end
  end

  def elegir
  	@postulation = Postulation.where(:favor_id => params[:favor_id]).where(:user_id => params[:user_id]).first
  	@postulation.update_attribute(:estado, "seleccionado")
    Favor.where(:id => params[:favor_id]).first.update_attribute(:estado, "procesando")
		Favor.where(:id => params[:favor_id]).first.update_attribute(:postulacion_id, @postulation.user_id)
  	Postulation.where(:favor_id => params[:favor_id]).where.not(:user_id => params[:user_id]).delete_all
  end

  def show
    @postulations = Postulation.where(:favor_id => params[:id]).all
  end
  private

  def postulation_params
  	params.require(:postulation).permit(:descripcion, :estado, :favor_id)
  end

	def positivo
		@postulation = Postulation.find(params[:id])
		@postulation.update_attribute(:estado, "aceptado")
		User.find(@postulation.user_id).puntos=User.find(@postulation.user_id).puntos+1
		@postulation.favor.update_attribute(:estado, "terminado")
		redirect_to (user_path(current_user.id))
		flash[:notice] = "Has calificado positivamente al postulado elegido"

	def calificar
		@postulation = Postulation.find(params[:id])

		# 2)Si fue negativa:
		# 		a)El favor se pone como cerrado (para reabrirlo luego)
		# 		b) El postulante se califica negativo
		#   	c) Al usuario se le restan dos puntos
		#
		# PARA QUE ESTA LA DESCRIPCION, SE PUEDE VER EN ALGUN LADO???
	end
end
