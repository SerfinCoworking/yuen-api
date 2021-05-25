class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    json_response(@products)
  end

  # GET /products/1
  def show
    json_response(@product)
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.company = current_user.current_company
    @product.save!
    
    json_response(@product, :created)
  end

  # PATCH/PUT /products/1
  def update
    @product.update!(product_params)
    
    json_response(@product, :ok)
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:barcode, :name, :description, :category_id)
    end
end
