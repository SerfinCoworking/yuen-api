class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Auth

  before_action :authorize_request
end
