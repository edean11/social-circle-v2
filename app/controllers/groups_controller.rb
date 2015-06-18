class GroupsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @groups = @user.groups
    else
      @groups = Group.all
    end
    respond_to do |format|
      format.json { render json: @groups}
    end
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      # binding.pry
      message = "Group Created Successfully!"
      redirect_to user_path(current_user), notice: message
    else
      flash.alert = "Your group could not be created. Please correct the errors below."
      render :new
    end
  end

  def destroy
  end

  protected

  def group_params
    params.require(:group).permit(:name, :description, :avatar)
  end
end
