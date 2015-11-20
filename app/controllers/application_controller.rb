class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # This is token auth
  before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) + [:name, :avatar, :home_lat, :home_lon]
    devise_parameter_sanitizer.for(:account_update) + [:name, :avatar, :home_lat, :home_lon]
  end

end
