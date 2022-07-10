class User < ApplicationRecord
  include Authenticable

  has_many :followings
  has_many :chats
  has_many :messages
end
