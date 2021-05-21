class StockLocationsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_stock_location, only: [:show, :update, :destroy]

  # GET /stock_locations
  def index
    @stock_locations = StockLocation.all

    json_response(@stock_locations)
  end

  # GET /stock_locations/1
  def show
    json_response(@stock_location)
  end

  # POST /stock_locations
  def create
    @stock_location = StockLocation.create!(stock_location_params)

    json_response(@stock_location, :created)
  end

  # PATCH/PUT /stock_locations/1
  def update
    @stock_location.update!(stock_location_params)
    
    json_response(@stock_location, :ok)
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
