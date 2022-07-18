class PhotosSerializer < SerializersBase
  attributes :id,
             :post_id,
             :user_id,
             :images,
             :image_url,
             :post,
             :user

  def image_url
    if object.images.attached?
      object.images.map do |image|
        rails_blob_path(image, only_path: true)
      end
    end
  end

  def post
    object.post
  end

  def user
    object.user
  end
end
