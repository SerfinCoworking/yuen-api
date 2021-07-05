class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show update destroy receive]


  # GET /purchases
  def index
    @purchases = Purchase.by_company(current_user.current_company)

    json_response(@purchases)
  end

  # GET /purchases/1
  def show
    json_response(@purchase)
  end

  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.company = current_user.current_company

    if @purchase.save
      render json: @purchase, status: :created
    else
      render_json_validation_error @purchase
    end
  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      render json: @purchase, status: :accepted
    else
      render_json_validation_error @purchase
    end
  end

  # GET /purchases/1/receive
  def receive
    if @purchase.received?
      json_response({ message: 'Compra ya recibida' }, :bad_request)
    else
      @purchase.receive
      render json: @purchase, status: :ok
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:reference_number, :request_date, :provider_id, :total_price)
  end
end
