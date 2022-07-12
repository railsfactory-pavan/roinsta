module ExceptionMethods
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
    # around_action :handle_exceptions
  end


  private

  # Catch exception and return JSON-formatted error
  def handle_exceptions
    # begin
    #   yield
    # rescue CanCan::AccessDenied => e
    #   render_unauthorized_response && return
    # rescue ActiveRecord::RecordNotFound => e
    #   @status = 404
    # rescue ActiveRecord::RecordInvalid => e
    #   render_unprocessable_entity_response(e.record) && return
    # rescue ArgumentError => e
    #   @status = 400
    # rescue StandardError => e
    #   @status = 500
    # end
    # detail = {detail: [e.try(:message)]}
    # detail.merge!(trace: e.try(:backtrace))
    # json_response({ success: false, message: e.class.to_s, errors: detail }, @status) unless e.class == NilClass
  end
end
