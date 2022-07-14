class CommentsSerializer < SerializersBase
  attributes :id,
             :body,
             :user_id,
             :post_id,
             :post,
             :user

  def post
    object.post
  end

  def user
    object.user
  end
end
