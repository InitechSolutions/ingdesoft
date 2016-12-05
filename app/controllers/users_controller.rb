class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(params[:id])
      puedo_ver=false
      #El dueño puede ver el perfil del postulado elegido y el postulado puede ver el perfil del dueño del favor
      if current_user.favors.where(:estado => "procesando").count > 0
        current_user.favors.where(:estado => "procesando").all.each do |favor|
          if (favor.postulacion_id == @user.id) || (current_user.id == favor.postulacion_id)
            puedo_ver=true
          end
        end
      end
      #Si no estoy viendo mi perfil pero ...
      if current_user.id != @user.id
        if !puedo_ver
          redirect_to (user_path(current_user.id)), error: "No tienes permiso"
          flash[:notice] = "No tenes permiso para ver otro perfil"
        end
      end
    else #else user_signed_in?
      redirect_to (root_path), error: "Debes iniciar sesion o registrarte"
      flash[:notice] = "Debes iniciar sesion o registrarte"
    end
  end

end
