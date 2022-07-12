class MessagesSerializer < SerializersBase
  attributes :id,
             :body,
             :user_id,
             :chat_id
end
