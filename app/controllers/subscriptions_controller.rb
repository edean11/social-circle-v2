class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    @groups = Group.all
  end

  def create
    group_id = params[:group_id]
    @group = Group.find(group_id)
    subscription = Subscription.create(:user_id => current_user.id, :group_id => @group.id)
  end

  def destroy
    subscription_id = params[:id]
    subscription = Subscription.find_by(id: subscription_id)
    subscription.destroy
  end

end
