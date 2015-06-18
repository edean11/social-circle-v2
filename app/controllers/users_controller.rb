class UsersController < ApplicationController

  before_action :require_login, except: [:index, :new, :create]

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
      redirect_to user_path(@user), :notice => "Welcome, #{@user.name}"
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :default_zip, :password, :password_confirmation, :avatar)
  end

end
