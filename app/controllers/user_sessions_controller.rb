class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:name], params[:user][:password])
      redirect_to user_path(@user), notice: "Welcome back, #{@user.name}"
    else
      @user = User.new(name: params[:user][:name])
      flash.alert = "We could not sign you in. Please check your name/password and try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been signed out."
  end
end
