class FollowingsSerializer < SerializersBase
  attributes :id,
             :user_id,
             :following_id,
             :user

  def user
    object.user
  end
end
