class UsersController < ApplicationController

  def show
    if user_signed_in?
  	   @user = User.find(params[:id])
       if current_user.id != @user.id
         current_user.favors.where(:estado => "procesando").all.each do |favor|
           if favor.postulations.first.user_id != @user.id
             redirect_to (user_path(current_user.id)), error: "No tienes permiso"
             flash[:notice] = "No tenes permiso para ver otro perfil"
           end
         end
       end
    else
      redirect_to (root_path), error: "Debes iniciar sesion o registrarte"
      flash[:notice] = "Debes iniciar sesion o registrarte"
    end
  end

  # def contacto
  #   if user_signed_in?
  #     @user = User.find(params[:id])
  #     if (favor.find()postulations.first.user_id != @user.id) || (Favor.user_id != current_user.id)
  #       redirect_to (contacto_path), error: "No tienes permiso"
  #     end
  #   else
  #     redirect_to (contacto_path), error: "Debe iniciar sesion o registrarse"
  #   end
  # end

end
