class CommentsSerializer < SerializersBase
  attributes :id,
             :body,
             :user_id,
             :post_id
end
