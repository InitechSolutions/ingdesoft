class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
    #redirects to previous page
end
def authorize_owner
	redirect_to (root_path) unless current_user.favors.find_by_user_id(params[:id])
end
  protected
  # parametros permitidos para el registro de usuarios
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :nacimiento, :telefono, :localidad, :puntos, :avatar, :imagen])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :nacimiento, :telefono, :localidad, :puntos, :avatar, :imagen])
  end
end
