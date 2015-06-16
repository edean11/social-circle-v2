class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      uploader = AvatarUploader.new
      uploader.store!(@user.avatar)
      redirect_to root_url, :notice => "Welcome, #{@user.name}"
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end
