module Authenticable
  extend ActiveSupport::Concern

  included do
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :user_name, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 },
                         if: -> { new_record? || !password.nil? }

    validate :acceptable_image

    after_validation :geocode
  end
end
