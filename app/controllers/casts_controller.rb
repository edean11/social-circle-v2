class CastsController < ApplicationController
  def index
    @casts = Cast.all
    respond_to do |format|
      format.json { render json: @casts}
    end
  end

  def new
    @cast = Cast.new
  end

  def create
    @cast = current_user.casts.build(cast_params)
    if @cast.save
      message = "Choose a location to attach this cast to or click 'Current Location' below"
      redirect_to user_path(current_user), notice: message
    else
      flash.alert = "Your knowledge could not be published. Please correct the errors below."
      render :new
    end
  end

  def destroy
    Cast.find(params[:id]).destroy
  end

  protected

  def cast_params
    params.require(:cast).permit(:title, :content, :expiration, :lat, :lon)
  end
end
