class CoffeeRoastSerializer < ActiveModel::Serializer
  attributes :id,
             :roast_name,
             :roast_description
end
