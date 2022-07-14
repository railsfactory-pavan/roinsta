class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :set_message, only: [:update_message, :destroy_message]

  # GET /chats
  def index
    @chats = Chat.all
    @messages = Message.all

    if @chats.present? or @messages.present?
      render json: {
        information: 'Data fetched successfully',
        chats: single_serializer.new(@chats, each_serializer: ChatsSerializer),
        messages: single_serializer.new(@messages, each_serializer: MessagesSerializer)
      }
    else
      render_unprocessable_entity('Chats or messages not found') unless @chats.present? or @messages.present?
    end
  end

  # GET /chats/1
  def show
    @messages = Message.where chat_id: @chat.id

    render json: {
      information: 'Data showes successfully',
      chat: single_serializer.new(@chat, each_serializer: ChatsSerializer),
      messages: single_serializer.new(@messages, each_serializer: MessagesSerializer)
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
        information: 'Data created successfully',
        chat: single_serializer.new(@chat, each_serializer: ChatsSerializer),
        message: single_serializer.new(@message, each_serializer: MessagesSerializer)
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
        render_success_response({
          chat: single_serializer.new(@chat, each_serializer: ChatsSerializer)
        }, 'Chat updated successfully')
     else
        render_unprocessable_entity_response(@chat)
      end
    end
  end

  # PATCH/PUT chats/update_message
  def update_message
    if @message.update body: params[:body],
                       user_id: @current_user.id,
                       chat_id: params[:chat_id]

      if @message.present?
        render_success_response({
          message: single_serializer.new(@message, each_serializer: MessagesSerializer)
        }, 'Message updated successfully')
      else
        render_unprocessable_entity_response(@message)
      end
    end
  end

  # DELETE /chats/1
  def destroy
    if @chat.destroy
      render_success_response({
        chat: {}
      }, 'Chat destroyed successfully')
    end
  end

  # DELETE /chats/destroy_message
  def destroy_message
    if @message.destroy
      render_success_response({
        message: {}
      }, 'Message destroyed successfully')
    end
  end

  private
  
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def set_message
    @message = Message.find(params[:id] || params[:message_id])
  end
end
