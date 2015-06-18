class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    @groups = Group.all
  end

  def create
    group_ids = params[:subscription][:groups][:group_id]
    error_arr = []
    group_ids.each do |group_id|
        if !group_id.empty?
            @group = Group.find(group_id)
            subscription = Subscription.create(:user_id => current_user.id, :group_id => @group.id)
            error_arr.push(subscription) if !subscription.valid?
        end
    end
    if error_arr.empty?
      message = "Subscription(s) Created Successfully!"
      redirect_to user_path(current_user), notice: message
    else
      flash.alert = "Your subscription(s) could not be created. Please correct the errors below."
      render :new
    end
  end

  def destroy
  end

end
