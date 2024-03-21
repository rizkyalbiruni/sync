class SetDialsController < ApplicationController
  def new
    @set_dial = SetDial.new
    @game = Game.find(params[:game_id])
    @topic = @game.topic
    @dial = @topic.dials.sample
    @setter_value = rand(1..100)
  end

  def create
    @user = current_user
    @game = Game.find(params[:game_id])
    @set_dial = SetDial.new(set_dial_params)
    @set_dial.game = @game
    @set_dial.user = @user
    @topic = @game.topic
    @dial = @topic.dials.sample
    @set_dial.dial = @dial
    @set_dial.save!
    redirect_to game_path(@game)
  end

  private

  def set_dial_params
    params.require(:set_dial).permit(:setter_word)
  end

end
