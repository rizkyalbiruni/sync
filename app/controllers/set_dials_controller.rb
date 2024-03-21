class SetDialsController < ApplicationController
  def new
    @set_dial = SetDial.new
    @topic = Topic.find(params[:topic_id])
    @dial = @topic.dials.sample
    @setter_value = rand(1..100)
  end

  def create
    @user = current_user
    @set_dial = SetDial.new(set_dial_params)
    @set_dial.save
    raise
  end

  private

  def set_dial_params
    params.require(:set_dial).permit(:setter_word)
  end

end
