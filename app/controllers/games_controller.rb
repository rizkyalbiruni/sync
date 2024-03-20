class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @game = Game.find(params[:id])
    @users = @game.users
    @set_dials = @game.set_dials
  end

  def create
    @game = Game.new(group_id: params[:group_id], topic_id:)
    if @game.save
      redirect_to @game
    else
      flash[:alert] = "Failed to create game"
      redirect_to @game
    end
  end

end
