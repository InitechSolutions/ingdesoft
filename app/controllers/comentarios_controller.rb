class ComentariosController < ApplicationController
  before_Action :find_favor
  def create
    @comentario=@favor.comentarios.create(params[:comentario].permit(:coment))
    @comentario.user_id = current_user.id
    @comentario.save

    if @comentario.save
        redirect_to favor_path(@favor_path)
    else
        render 'new'
    end
  end

  private
  def find_favor
    @favor = Favor.find(params[:user_id])

  end
end
