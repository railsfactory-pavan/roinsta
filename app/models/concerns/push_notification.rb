require 'fcm'

module PushNotification
  extend ActiveSupport::Concern

  SERVER_KEY = Rails.application.credentials[Rails.env.to_sym][:firebase_cloud_messaging][:server_key]

  def user_avatar_seen_notification user, message
    fcm_client = FCM.new(SERVER_KEY)

    if user.registration_ids.reject(&:empty?).any?
      options = {
        priority: "high",
        "content_available": true,
        "notification": {
          "title": "Avatar viewed notification",
          "body": message
        }
      }

      response =  fcm_client.send(user.registration_ids.uniq.reject(&:empty?), options)
      
      Rails.logger.info response
      Rails.logger.info options
    end
  end

  def self.user_login_notification user, message
    fcm_client = FCM.new(SERVER_KEY)

    if user.registration_ids.reject(&:empty?).any?
      options = {
        priority: "high",
        "content_available": true,
        "notification": {
          "title": "User login notification",
          "body": message
        }
      }

      response = fcm_client.send(user.registration_ids.uniq.reject(&:empty?), options)

      Rails.logger.info response
      Rails.logger.info options
    end
  end
end
