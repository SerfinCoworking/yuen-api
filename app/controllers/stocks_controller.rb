class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  # GET /stocks
  def index
    @stocks = Stock.by_company(current_user.current_company)

    json_response(@stocks)
  end

  # GET /stocks/1
  def show
    json_response(@stock)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = Stock.find(params[:id])
  end
end
