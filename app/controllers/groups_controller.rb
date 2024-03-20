class GroupsController < ApplicationController
  def create
    @groups = current_user.groups
    @group = Group.new(group_params)
    if @group.save
      @group_subscription = GroupSubscription.new
      @group_subscription.user = current_user
      @group_subscription.group = @group
      @group_subscription.save
      redirect_to root_path
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :code)
  end
end
