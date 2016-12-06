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

	def positivo
		@postulation = Postulation.find(params[:id])
		@postulation.update_attribute(:estado, "aceptado")
		@usuario=User.find(@postulation.user_id)
		@usuario.puntos=@usuario.puntos+1
		@usuario.save
		@postulation.favor.update_attribute(:estado, "terminado")
		flash[:notice] = "Has calificado positivamente al postulado elegido"
		redirect_to (user_path(current_user.id))
	end

	def calificar
		@postulation = Postulation.find(params[:id])
	end

	def update
		@postulation = Postulation.find(params[:id])
			if @postulation.update_attribute(:explicacion, postulation_params[:explicacion])
				@postulation.favor.update_attribute(:estado, "rechazado")
				@usuario=User.find(@postulation.user_id)
				@usuario.puntos=@usuario.puntos-2
				@usuario.save
				flash[:notice] = "Has calificado negativamente al postulado elegido"
				redirect_to user_path(current_user.id)
			else
				flash[:notice] = "Ha sucedido un error"
		  end
	end

	#NO ESCRIBIR DEBAJO DE ESTA LINEA
	private

	def postulation_params
			params.require(:postulation).permit(:user_id, :favor_id,:descripcion,:estado,:explicacion)
	end

end
