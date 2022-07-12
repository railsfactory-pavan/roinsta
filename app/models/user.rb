class User < ApplicationRecord
  include Authenticable

  has_many :followings, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :messages
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :photos
  has_many :comments, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :likes
end
