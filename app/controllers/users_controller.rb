class UsersController < ApplicationController

  def show
    if user_signed_in?
  	     @user = User.find(params[:id])
         if current_user.id != @user.id
           redirect_to (root_path), error: "No tienes permiso"
         end
    else
      redirect_to (root_path), error: "Debes iniciar sesion o registrarte"
    end
  end
  # def contacto
  #   @user = User.find(params[:id])
  #   if user_signed_in? && (Favor.postulacion_id == @user.id)
  #     redirect_to (contacto_path)
  #   else
  #     redirect_to (root_path), error: "No tienes permiso"
  #   end
  # end

end
