class UsersSerializer < SerializersBase
  attributes :id,
             :email,
             :full_name,
             :user_name,
             :about,
             :avatar,
             :avatar_url,
             :followings,
             :chats,
             :messages,
             :posts,
             :photos,
             :comments,
             :likes

  def avatar_url
    if object.avatar.attached?
      rails_blob_path(object.avatar, only_path: true)
    end
  end


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
