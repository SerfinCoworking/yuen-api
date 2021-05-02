class AuthorizationService

  # esto es poco elegante, hay que buscar una opcion mas elegante
  # tome los scopes desde un archivo de scopes
  SCOPES = {
    '/users' => ['read:users']
  }

  def initialize(headers = {}, path_info)
    @headers = headers
    @path_info = path_info
  end

  def authenticate_request!
    @auth_payload = verify_token
  end
  
  def authorize_request!
    scope_included
  end

  private

  # verificamos el scope
  def scope_included
    if SCOPES[@path_info] == nil
      true
    else
      (String(@auth_payload[0]['scope']).split(' ') & (SCOPES[@path_info])).any?
    end
  end


  def http_token
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    end
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end

end