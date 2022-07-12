class UsersSerializer < SerializersBase
  attributes :id,
             :email,
             :full_name,
             :user_name,
             :about,
             :avatar,
             :followings,
             :chats,
             :messages,
             :posts,
             :photos,
             :comments,
             :likes


  def followings
    array_serializer.new(object.followings, serializer: FollowingsSerializer)
  end

  def chats
    array_serializer.new(object.chats, serializer: ChatsSerializer)
  end

  def messages
    array_serializer.new(object.messages, serializer: MessagesSerializer)
  end

  def posts
    array_serializer.new(object.posts, serializer: PostsSerializer)
  end

  def photos
    array_serializer.new(object.photos, serializer: PhotosSerializer)
  end

  def comments
    array_serializer.new(object.comments, serializer: CommentsSerializer)
  end

  def likes
    array_serializer.new(object.likes, serializer: LikesSerializer)
  end
end
