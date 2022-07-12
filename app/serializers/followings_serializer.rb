class FollowingsSerializer < SerializersBase
  attributes :id,
             :user_id,
             :following_id
end
