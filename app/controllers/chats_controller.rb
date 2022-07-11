class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :set_message, only: [:update, :destroy_message]

  # GET /chats
  def index
    @chats = Chat.all
    @messages = Message.where chat_id: @chats.ids

    render json: {
      chats:  @chats,
      messages: @messages
    }
  end

  # GET /chats/1
  def show
    @messages = Message.where chat_id: @chat.id

    render json: {
      chat: @chat,
      messages: @messages
    }
  end

  # POST /chats
  def create
    @chat = Chat.find_or_create_by! user_id: @current_user.id,
                                    recipient_id: params[:recipient_id]

    if @chat.present?
      @message = Message.find_or_create_by! body: params[:body],
                                            user_id: @current_user.id,
                                            chat_id: @chat.id

      render json: {
        chat: @chat,
        message: @message
      }, status: :created, location: {
        chat: @chat,
        message: @message
      }
    else
      render json: {
        chat_errors: @chat.errors,
        message_error: @message.errors
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update user_id: @current_user.id,
                    recipient_id: params[:recipient_id]

      if @chat.present?
        @message.update body: params[:body],
                        user_id: @current_user.id,
                        chat_id: @chat.id

        render json: {
          chat: @chat,
          message: @message
        }
     else
        render json: {
          chat_errors: @chat.errors,
          message_error: @message.errors
        }, status: :unprocessable_entity
      end
    end
  end

  # DELETE /chats/1
  def destroy
    if @current_user.present?
      if @chat.destroy
        render json: 'Chat deleted', status: :ok
      end
    end
  end

  # DELETE /chats/destroy_message
  def destroy_message
    if @current_user.present?
      if @message.destroy
        render json: 'Message deleted', status: :ok
      end
    end
  end

  private
  
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
