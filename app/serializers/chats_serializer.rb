class ChatsSerializer < SerializersBase
  attributes :id,
             :user_id,
             :recipient_id,
             :messages,
             :user

  def messages
    object.messages
  end

  def user
    object.user
  end
end
