class MessagesController < ApplicationController
  before_action :set_user
  skip_before_action :verify_authenticity_token

  def create
    message = @user.received_messages.create(
      sender:   current_user,
      content:  message_params[:content]
    )
    render json: message
  end

  def index
    @messages = Message.between(@user, current_user)
    @channel = "messages:#{[@user.id, current_user.id].sort.join(':')}"
    respond_to do |format|
      format.html do
        @message = Message.new
      end
      format.json do
        render json: @messages.map{|m| m.attributes.merge(sender: m.sender.attributes, recipient: m.recipient.attributes) }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
