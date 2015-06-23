class UserSessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    if @user = login(params[:user][:name], params[:user][:password])
      redirect_to user_path(@user)
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
