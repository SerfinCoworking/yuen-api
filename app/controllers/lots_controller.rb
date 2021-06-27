class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :update, :destroy]

  # GET /lots
  def index
    @lots = Lot.all

    render json: @lots
  end

  # GET /lots/1
  def show
    render json: @lot
  end

  # POST /lots
  def create
    @lot = Lot.new(lot_params)

    if @lot.save
      render json: @lot, status: :created, location: @lot
    else
      render json: @lot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lots/1
  def update
    if @lot.update(lot_params)
      render json: @lot
    else
      render json: @lot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lots/1
  def destroy
    @lot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lot_params
      params.require(:lot).permit(:stock_id, :company_id, :product_id, :provider_id, :cost_price, :manufacturing_date, :expiry_date, :reserved_quantity, :available_quantity, :total_quantity)
    end
end
