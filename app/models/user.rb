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

  has_one :location

  has_one_attached :avatar

  geocoded_by :full_street_address

  private

  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, 'Avatar is too big')
    end

    acceptable_types = ["image/jpeg", "image/jpg", 'image/png']

    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, 'Avatar must be JPEG, JPG or PNG format')
    end
  end

  def avatar_present?
    errors.add(:avatar, :blank) unless avatar.attached?
  end

  def full_street_address
  end
end
