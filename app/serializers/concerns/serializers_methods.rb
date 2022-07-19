module SerializersMethods
  extend ActiveSupport::Concern

  def array_serializer
    ActiveModel::Serializer::CollectionSerializer
  end

  def single_serializer
    ActiveModelSerializers::SerializableResource
  end

  def pagination_meta object
    {
      current_page: object.current_page,
      next_page:    object.next_page,
      prev_page:    object.prev_page,
      total_pages:  object.total_pages,
      total_count:  object.total_count
    }
  end
end