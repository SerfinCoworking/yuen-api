class LotsController < ApplicationController
  before_action :set_lot, only: %i[show]

  # GET /lots
  def index
    @lots = Lot.all

    render json: @lots
  end

  # GET /lots/1
  def show
    render json: @lot
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lot
    @lot = Lot.find(params[:id])
  end
end
