class User < ApplicationRecord
  include Authenticable

  has_many :followings
end
