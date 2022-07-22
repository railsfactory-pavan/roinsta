class LocationsSerializer < SerializersBase
  attributes :id,
             :company_name,
             :address,
             :city,
             :postcode,
             :latitude,
             :longitude,
             :user

  def user
    object.user
  end
end
