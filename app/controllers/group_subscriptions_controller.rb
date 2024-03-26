class GroupSubscriptionsController < ApplicationController
  def create
    @group_subscription = GroupSubscription.new
    @group_subscription.user = current_user
    @group_subscription.group = Group.find_by(code: params[:other][:code])
    if @group_subscription.save
      GroupUpdateChannel.broadcast_to(
        @group_subscription.group,
        "<p> #{@group_subscription.user.name} </p>"
      )
      redirect_to root_path, notice: "joined succesfully"
    else
      redirect_to root_path, alert: "error"
    end
  end
end

# you should have the code of the params sent by form
# submit a form to join group should redirect to groupsubscript
# then creat new instance of GS model
