class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_adoption

  def index
    @messages = @adoption.messages
    @message = Message.new
  end

  def create
    @message = @adoption.messages.build(message_params)
    @message.user = current_user
    if @message.save
      redirect_to adoption_messages_path(@adoption), notice: 'Message sent successfully.'
    else
      @messages = @adoption.messages
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_adoption
    @adoption = Adoption.find(params[:adoption_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
