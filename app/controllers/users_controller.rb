class UsersController < ApplicationController

  def show
    if user_signed_in?
  	   @user = User.find(params[:id])
       if current_user.id != @user.id
         #El dueño puede ver al postulado elegido
         if current_user.favors.where(:estado => "procesando").count > 0
           current_user.favors.where(:estado => "procesando").all.each do |favor|
             if favor.postulacion_id != @user.id
               redirect_to (user_path(current_user.id)), error: "No tienes permiso"
               flash[:notice] = "No tenes permiso para ver otro perfil"
             end
           end
         #El postulado puede ver al dueño del favor
         elsif @user.favors.where(:estado => "procesando").count > 0
           @user.favors.where(:estado => "procesando").all.each do |favor|
             if favor.postulacion_id != current_user.id
               redirect_to (user_path(current_user.id)), error: "No tienes permiso"
               flash[:notice] = "No tenes permiso para ver otro perfil"
             end
           end
         else
           redirect_to (user_path(current_user.id)), error: "No tienes permiso"
           flash[:notice] = "No tenes permiso para ver otro perfil"
         end #end if count
       end #end if current_user.id != @user.id
    else
      redirect_to (root_path), error: "Debes iniciar sesion o registrarte"
      flash[:notice] = "Debes iniciar sesion o registrarte"
    end
  end

end
