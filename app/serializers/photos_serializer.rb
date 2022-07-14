class PhotosSerializer < SerializersBase
  attributes :id,
             :image,
             :post_id,
             :user_id,
             :post,
             :user

  def post
    object.post
  end

  def user
    object.user
  end
end
