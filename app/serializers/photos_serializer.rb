class PhotosSerializer < SerializersBase
  attributes :id,
             :image,
             :post_id,
             :user_id
end
