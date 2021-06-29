module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_created_response(object)
    render json: { status: :created, data: object.as_json}
  end
end
