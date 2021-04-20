# Includes methods to make HTTP request specs easier ti work with
module RequestHelpers
  def json
    JSON.parse(response.body)
  end
end