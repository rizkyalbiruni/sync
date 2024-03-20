class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(group_id: params[:group_id], topic_id: params[:topic_id])
    if @game.save
      redirect_to new_topic_set_dial_path(params[:topic_id])
    end
  end
end
