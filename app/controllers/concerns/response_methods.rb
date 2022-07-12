module ResponseMethods
  extend ActiveSupport::Concern

  private

  def render_success_response(resources = {}, message = "", status = 200, meta = {})
    json_response({
      success: true,
      message: message,
      data: resources,
      meta: meta
    }, status)
  end

  def render_unprocessable_entity_response(resource)
    json_response({
      success: false,
      message: 'Validation failed',
      errors: { detail: resource.errors.full_messages }#ValidationErrorsSerializer.new(resource).serialize
    }, 422)
  end

  def render_unprocessable_entity(message)
    json_response({
      success: false,
      data: {},
      meta: {},
      errors: { detail: message }
    }, 422) and return true
  end

  def render_unauthorized_response
    json_response({
      success: false,
      message: 'You are not authorized.'
    }, 401)
  end

  def json_response(options = {}, status = 500)
    render json: JsonResponse.new(options), status: status
  end
end