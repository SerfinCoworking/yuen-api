class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]

  # GET /purchases
  def index
    @purchases = Purchase.all

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
    @purchase.save!
    
    json_response(@purchase, :created)
  end

  # PATCH/PUT /purchases/1
  def update
    @purchase.update!(purchase_params)
    
    json_response(@purchase, :ok)
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
      params.require(:purchase).permit(:barcode, :name, :description, :category_id, :unity_id)
    end
end
