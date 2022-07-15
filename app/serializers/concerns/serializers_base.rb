class SerializersBase < ActiveModel::Serializer
  include SerializersMethods
  include Rails.application.routes.url_helpers
end