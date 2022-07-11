class User < ApplicationRecord
  include Authenticable

  has_many :followings
  has_many :chats, dependent: :destroy
  has_many :messages
  has_many :posts
  has_many :photos, through: :posts
  has_many :comments
  has_many :comments, through: :posts
  has_many :likes
  has_many :likes, through: :posts
end
