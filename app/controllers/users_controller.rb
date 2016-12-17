class UsersController < ApplicationController

  def show
    if user_signed_in?

      @logros = Logro.all
      @user = User.find(params[:id])
      puntos= @user.puntos
      @logro = Logro.buscar_logro(puntos, puntos).order('created_at DESC').all
      puedo_ver=false
      if current_user.admin?
        puedo_ver = true
      end
      #El dueño puede ver el perfil del postulado elegid
      if current_user.favors.where(:estado => "procesando").count > 0
        current_user.favors.where(:estado => "procesando").all.each do |favor|
          if (favor.postulacion_id == @user.id)
            puedo_ver=true
          end
        end
      end
      #El postulado puede ver el perfil del dueño del favor
      if Favor.where(:estado => "procesando").count > 0
        Favor.where(:estado => "procesando").all.each do |favor|
          if (favor.postulacion_id == current_user.id) && (favor.user_id == @user.id)
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
