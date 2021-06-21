class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: %i[show update destroy]

  # GET /product_categories
  def index
    @product_categories = ProductCategory.by_company(current_user.current_company)

    json_response(@product_categories)
  end

  # GET /product_categories/1
  def show
    json_response(@product_category)
  end

  # POST /product_categories
  def create
    @product_category = ProductCategory.new(product_category_params)
    @product_category.company = current_user.current_company

    if @product_category.save
      render json: @product_category, status: :created
    else
      render_json_validation_error @product_category
    end
  end

  # PATCH/PUT /product_categories/1
  def update
    if @product_category.update(product_category_params)
      render json: @product_category, status: :ok
    else
      render_json_validation_error @product_category
    end
  end

  # DELETE /product_categories/1
  def destroy
    @product_category.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_category_params
    params.require(:product_category).permit(:parent_id, :name)
  end
end
