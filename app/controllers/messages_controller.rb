class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]
  before_filter :require_signed_in!

  helper_method :current_user
  
  def index
    @messages = current_user.received_messages
  end
  
  def show
  end
  
  def new
    @message = Message.new
  end
  
  def create
    recipient = Post.find(params[:id]).user
    @message = Message.new(message_params)
    @message.creator = current_user
    @message.recipient = recipient
    
    if @message.save
      redirect_to posts_url
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end
  
  def update
    if @message.update(post_params)
      redirect_to @post
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:title, :message, :recipient, :read)
  end
end