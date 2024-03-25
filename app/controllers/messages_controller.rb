class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @game = Game.find(params[:game_id])
    @group = @game.group
    @message.group = @group
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @game,
        render_to_string(partial: "message", locals: {message: @message})
      )
    else
      render "games/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
