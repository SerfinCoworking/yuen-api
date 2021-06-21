class PurchaseProductsController < ApplicationController
  before_action :set_purchase_product, only: %i[show update destroy]

  # GET /purchase_products
  def index
    @purchase_products = PurchaseProducts.all

    json_response(@purchase_products)
  end

  # GET /purchase_products/1
  def show
    json_response(@purchase_product)
  end

  # POST /purchase_products
  def create
    @purchase_product = PurchaseProduct.new(purchase_product_params)
    @purchase_product.company = current_user.current_company

    if @purchase_product.save
      render json: @purchase_product, status: :created
    else
      render_json_validation_error @purchase_product
    end
  end

  # PATCH/PUT /purchase_products/1
  def update
    if @purchase_product.update(purchase_product_params)
      render json: @purchase_product, status: :ok
    else
      render_json_validation_error @purchase_product
    end
  end

  # DELETE /purchase_products/1
  def destroy
    @purchase_product.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_product
    @purchase_product = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_product_params
    params.require(:purchase_product).permit(:reference_number, :date, :provider_id, :price_list_id)
  end
end
