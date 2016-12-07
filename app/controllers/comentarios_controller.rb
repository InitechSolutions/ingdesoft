class ComentariosController < ApplicationController

def index
  @comentarios = Comentario.all
end

def new
  @comentario = Comentario.new
end

def create
  @comentario = current_user.comentarios.build(comentario_params)
  @comentario.favor_id = params[:comentario][:favor_id]
  if @comentario.save
    redirect_to favor_path(@comentario.favor_id), notice: "Comentario creado con exito"
  else
    render 'new'
  end
end

def show
  @comentario = Comentario.find(params[:id])
end

private

  def comentario_params
    params.require(:comentario).permit(:user_id, :favor_id, :coment)
  end
end
