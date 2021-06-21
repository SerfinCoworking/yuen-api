class StockLocationsController < ApplicationController
  before_action :set_stock_location, only: %i[show update destroy]

  # GET /stock_locations
  def index
    @stock_locations = StockLocation.by_company(current_user.current_company)

    json_response(@stock_locations)
  end

  # GET /stock_locations/1
  def show
    json_response(@stock_location)
  end

  # POST /stock_locations
  def create
    @stock_location = StockLocation.new(stock_location_params)

    if @stock_location.save
      render json: @stock_location, status: :created
    else
      render_json_validation_error @stock_location
    end
  end

  # PATCH/PUT /stock_locations/1
  def update
    if @stock_location.update(stock_location_params)
      render json: @stock_location, status: :ok
    else
      render_json_validation_error @stock_location
    end
  end

  # DELETE /stock_locations/1
  def destroy
    @stock_location.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stock_location
    @stock_location = StockLocation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stock_location_params
    params.require(:stock_location).permit(:name, :company_id)
  end
end
