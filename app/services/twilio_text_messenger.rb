class TwilioTextMessenger
  attr_reader :message, :receiver_phone_number

  def initialize message, receiver_phone_number
    @message = message
    @receiver_phone_number = receiver_phone_number
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials[Rails.env.to_sym][:twilio][:twilio_phone_number],
      to: receiver_phone_number,
      body: message
    })
  end
end
