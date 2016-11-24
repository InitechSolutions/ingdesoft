class ComentariosController < ApplicationController

def index
  @comentarios = Comentario.all
end

def new
  @comentario = Comentario.new
end

def create
  @favor = Favor.find(params[:favor_id])
  @comentario = Comentario.new(comentario_params)
  @comentario = @favor.comentarios.create(comentario_params)
  @comentario.user_id = current_user.id
  if @comentario.save
    flash[:success] = "Comment successfully added"
    redirect_to comentarios_path(@comentario)
  else
    render 'new'
  end
end

def show
  @comentario = Comentario.find(params[:id])
end

private

  def comentario_params
    params.require(:coment).permit(:user_id, :favor_id)
  end
end
