class Users::SessionsController < Devise::SessionsController

  before_filter :configure_sign_in_params, only: [:create]

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been signed out."
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :name
  end
end
