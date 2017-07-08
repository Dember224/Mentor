class MessagesController < ApplicationController
  def new
    @message =  Message.new
    @messages = Message.all
    @user = User.all
  end

  def create
    @message = Message.new(message_params)
  end

  def agreed
    @choosen = []
    for pair in Pair.all
      if pair.user_id == current_user.id
        @choosen.push(pair.mentee_id)
      end
    end
    return @choosen
  end

  helper_method :agreed

  private

  def message_params
    params.require(:message).permit(:from, :to, :message)
  end
end
