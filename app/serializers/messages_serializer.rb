class MessagesSerializer < SerializersBase
  attributes :id,
             :body,
             :user_id,
             :chat_id,
             :chat,
             :user

  def chat
    object.chat
  end

  def user
    object.user
  end
end
