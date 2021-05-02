class SecuredController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    @auth_service = AuthorizationService.new(request.headers, request.env['PATH_INFO'])
    @auth_service.authenticate_request!
    render json: { errors: ['Insufficient scope'] }, status: :unauthorized unless @auth_service.authorize_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

end