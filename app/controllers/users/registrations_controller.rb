class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  def index
    @users = User.all
    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @users}
    end
  end

  def show
    @user = User.find(params[:id])
    @now = Time.current()
    respond_to do |format|
      if current_user===@user
        format.html { render 'show'}
      else
        format.html { redirect_to user_path(current_user)}
      end
      format.json { render json: @user}
    end
  end

  def new
    @user = User.new
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :avatar, :avatar_url, :default_zip,
     :password, :password_confirmation, :home_lat, :home_lon)}
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :avatar, :avatar_url, :default_zip,
     :password, :password_confirmation, :home_lat, :home_lon)}
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_url, :default_zip, :password, :password_confirmation, :home_lat, :home_lon)
  end

end
