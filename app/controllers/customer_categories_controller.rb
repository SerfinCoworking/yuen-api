class CustomerCategoriesController < ApplicationController
  before_action :set_customer_category, only: [:show, :update, :destroy]

  # GET /customer_categories
  def index
    @customer_categories = CustomerCategory.all

    json_response(@customer_categories)
  end

  # GET /customer_categories/1
  def show
    json_response(@customer_category)
  end

  # POST /customer_categories
  def create
    @customer_category = CustomerCategory.new(customer_category_params)
    @customer_category.company = current_user.current_company
    @customer_category.save!

    json_response(@customer_category, :created)
  end

  # PATCH/PUT /customer_categories/1
  def update
    @customer_category.update!(customer_category_params)
    
    json_response(@customer_category, :ok)
  end

  # DELETE /customer_categories/1
  def destroy
    @customer_category.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_category
      @customer_category = CustomerCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_category_params
      params.require(:customer_category).permit(:name, :description)
    end
end
