class CastsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @casts = @user.casts
    elsif params[:group_id]
      @group = Group.find(params[:group_id])
      @casts = @group.casts
    else
      @casts = Cast.all
    end
    respond_to do |format|
      format.json { render json: @casts}
    end
  end

  def new
    @cast = Cast.new
    @groups = Group.all
  end

  def create
    @cast = current_user.casts.build(cast_params)
    @groups_ids = params[:cast][:group_ids]
    if @cast.save
      @groups_ids.each do |group_id|
        if !group_id.empty?
          @group = Group.find(group_id)
          Castgroup.create(:cast_id => @cast.id, :group_id => @group.id)
        end
      end
      message = "Cast Created Successfully!"
      redirect_to user_path(current_user), notice: message
    else
      flash.alert = "Your cast could not be created. Please correct the errors below."
      render :new
    end
  end

  def destroy
    Cast.find(params[:id]).destroy
  end

  protected

  def cast_params
    params.require(:cast).permit(:title, :content, :expiration, :lat, :lon, :group_ids)
  end
end
