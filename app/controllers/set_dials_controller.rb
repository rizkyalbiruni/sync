class SetDialsController < ApplicationController
  def new
    @set_dial = SetDial.new

    @dial = Dial.all.sample
    @setter_value = rand(1..100)
  end

  def create
    @user = current_user
    @set_dial = SetDial.new(set_dial_params)
    @set_dial.save

  end

  private

  def set_dial_params
    params.require(:set_dial).permit(:setter_word)
  end

end
