module Auth
  # esto es poco elegante, hay que buscar una opcion mas elegante
  # tome los scopes desde un archivo de scopes
  SCOPES = {
    '/users' => ['index:users'],
    '/products' => ['index:products']
  }

  def authorize_request
    @headers = request.headers
    @path_info = request.env['PATH_INFO']

    authenticate_request!
    render json: { errors: ['Insufficient scope'] }, status: :unauthorized unless authorize_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def authorize_request!
    scope_included
  end

  def current_user
    @current_user
  end

  private

  def authenticate_request!
    @auth_payload = verify_token
    @current_user = User.find_by(auth0_id: @auth_payload[0]['sub'])
  end

  # verificamos el scope
  def scope_included
    if SCOPES[@path_info].nil?
      true
    else
      # (String(@auth_payload[0]['scope']).split(' ') & (SCOPES[@path_info])).any?
      # Permit until implement roles
      true
    end
  end

  def http_token
    @headers['Authorization'].split(' ').last if @headers['Authorization'].present?
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end
end
