class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_groups_subscriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
