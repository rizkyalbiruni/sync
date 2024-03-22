class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @game = Game.find(params[:id])
    @game.update(status: true)
    @users = @game.users
    @set_dials = @game.set_dials
    @user = current_user
  end




  def create
    @game = Game.find_by(group_id: params[:group_id])
    if @game
      @game.update(topic_id: params[:topic_id])
      redirect_to @game, notice: "topic changed"
    else
      @game = Game.new(group_id: params[:group_id], topic_id: params[:topic_id])
      if @game.save
        # redirect_to new_topic_set_dial_path(params[:topic_id])
        redirect_to @game
      else
        flash[:alert] = "Failed to create game"
        redirect_to @game
      end
     end
   end
end
