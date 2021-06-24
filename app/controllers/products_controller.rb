class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.by_company(current_user.current_company)

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

    if @product.save
      render json: @product, status: :created
    else
      render_json_validation_error @product
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product, status: :accepted
    else
      render_json_validation_error @product
    end
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
    params.require(:product).permit(:barcode, :name, :description, :category_id, :quantity_per_unit, :unity_id)
  end
end
