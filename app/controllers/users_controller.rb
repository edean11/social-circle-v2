class UsersController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :new, :create]

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

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_url, :default_zip, :password, :password_confirmation, :home_lat, :home_lon)
  end

end
