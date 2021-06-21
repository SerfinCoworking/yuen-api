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

  def render_json_validation_error(resource)
    render json: resource, status: 422, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
