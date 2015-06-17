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
    @myCasts = @user.casts
    respond_to do |format|
      format.html { render 'show'}
      format.json { render json: @myCasts}
    end
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

  def load_user
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = User.new
    end
    if params[:user].present?
      @user.assign_attributes(user_params)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :default_zip, :password, :password_confirmation, :avatar)
  end

end
