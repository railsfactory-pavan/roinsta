class Location < ApplicationRecord
  belongs_to :user

  geocoded_by :address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country_code
      end
    end

  after_validation :reverse_geocode

  def address
  end

  private

  def address_changed? 
    street_changed? || city_changed? || zip_changed? || state_changed? || country_changed?
  end 
end
