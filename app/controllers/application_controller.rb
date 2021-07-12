class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Auth
  include ErrorSerializer

  before_action :authorize_request

  def render_json_error(status, error_code, extra = {})
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol

    error = {
      title: I18n.t("error_messages.#{error_code}.title"),
      status: status,
      code: I18n.t("error_messages.#{error_code}.code")
    }.merge(extra)

    detail = I18n.t("error_messages.#{error_code}.detail", default: '')
    error[:detail] = detail unless detail.empty?

    render json: { errors: [error] }, status: status
  end

  def render_json_validation_error(resource = nil, serializer_options = {})
    resp_data = { status: 'danger' }
    resp_data[:errors] = resource.errors if resource.errors.any?
    resp_data[:data] = ActiveModelSerializers::SerializableResource.new(resource, serializer_options) if resource
    render json: resp_data, status: 422
  end

  def render_success_response(data = nil, message = nil, serializer_options = {})
    resp_data = { status: 'success' }
    resp_data[:message] = message if message
    # Serialize the resource
    resp_data[:data] = ActiveModelSerializers::SerializableResource.new(data, serializer_options) if data
    render json: resp_data, status: 200
  end
end
