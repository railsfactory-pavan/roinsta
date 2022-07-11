class User < ApplicationRecord
  include Authenticable

  has_many :followings, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :messages, through: :chats
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :photos, through: :posts
  has_many :comments, dependent: :destroy
  has_many :comments, through: :posts
  has_many :likes, dependent: :destroy
  has_many :likes, through: :posts
end
