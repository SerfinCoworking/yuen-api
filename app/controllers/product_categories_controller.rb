class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :update, :destroy]

  # GET /product_categories
  def index
    @product_categories = ProductCategory.all

    json_response(@product_categories)
  end

  # GET /product_categories/1
  def show
    json_response(@product_category)
  end

  # POST /product_categories
  def create
    @product_category = ProductCategory.create!(product_category_params)

    json_response(@product_category, :created)
  end

  # PATCH/PUT /product_categories/1
  def update
    @product_category.update!(product_category_params)
    json_response(@product_category, :ok)
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
