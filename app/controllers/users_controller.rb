class UsersController < ApplicationController

  before_action :require_login, except: [:index, :new, :create]

  def index
    @users = User.all
    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @users}
    end
  end

  def edit
    if !current_user
      redirect_to root_path
    else
       @user = current_user
    end
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
      flash.notice = "Your profile has been updated"
    else
      flash.alert = "Please fix the errors below to continue"
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @now = Time.current()
    respond_to do |format|
      format.html { render 'show'}
      format.json { render json: @user}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = params[:user][:avatar]
    if @user.save
      binding.pry
      auto_login(@user)
      # uploader = AvatarUploader.new
      # uploader.store!(@user.avatar)
      redirect_to user_path(@user), :notice => "Welcome, #{@user.name}"
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_url, :default_zip, :password, :password_confirmation)
  end

end
