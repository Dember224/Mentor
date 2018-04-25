class MessagesController < ApplicationController
  def new
    @message =  Message.new
    @messages = Message.all
    @order_messages = Message.order(:created_at)
    @user = User.all
  end

  def create
    @message = Message.new(message_params)
    @last_message =
      if (@user != nil)
        Message.find_by_from(User.find_by_email(@user).id)
      elsif @user == nil && defined?(current_user) != nil
        Message.find_by_from(User.find(current_user.id).id)
      end
    if @message.save
      if @last_message.class != Array
        MessageMailer.message_email(User.find_by_id(@last_message.to).email).deliver_now
      else
        MessageMailer.message_email(User.find_by_id(@last_message.last.to).email).deliver_now
      end
      redirect_to '/message' and return
    end
  end

  def index
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
