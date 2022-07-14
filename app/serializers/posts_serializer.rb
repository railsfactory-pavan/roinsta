class PostsSerializer < SerializersBase
  attributes :id,
             :location,
             :user_id,
             :photos,
             :comments,
             :likes,
             :user

  def photos
    array_serializer.new(object.photos, serializer: PhotosSerializer)
  end

  def comments
    array_serializer.new(object.comments, serializer: CommentsSerializer)
  end

  def likes
    array_serializer.new(object.likes, serializer: LikesSerializer)
  end

  def user
    object.user
  end
end
