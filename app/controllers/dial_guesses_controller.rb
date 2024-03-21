class DialGuessesController < ApplicationController

  def new
    @dial_guess = DialGuess.new
    @user = current_user
    @set_dial = SetDial.find(params[:set_dial_id])
    @topic = @set_dial.dial.topic
    @left = @set_dial.dial.left
    @right = @set_dial.dial.right
  end

  def create
    @guess_params = params.require(:guess).permit(:guessed_value) # guess form has a field named guessed_value?
    @set_dial = @game.set_dials.find_by(user_id: current_user.id)

    @guess = set_dial.dial_guesses.build(user: current_user, guessed_value: guess_params[:guessed_value])

    if @guess.save
      calculate_points
      redirect_to @game, notice: "Guess submitted successfully!"
    else
      flash[:alert] = "Failed to submit guess"
      render :show
    end
  end

  def next_guess
    # Logic to move to the next guess
    # Redirect to the same show page with updated information
    redirect_to @game, notice: "Moved to the next guess!"
  end


  private

  def game_params
    params.require(:game).permit(:group_id, :topic_id)
  end
  # Method to calculate points scored in the game
  def calculate_points
    difference = (set_dial.setter_value - @guess.guessed_value).abs
    points = 100 - difference # 100 is the maximum points for each guess
    current_user.update(points: current_user.points + points)


  end

end
