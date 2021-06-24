class CustomerCategoriesController < ApplicationController
  before_action :set_customer_category, only: %i[show update destroy]

  # GET /customer_categories
  def index
    @customer_categories = CustomerCategory.by_company(current_user.current_company)

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

    if @customer_category.save
      render json: @customer_category, status: :created
    else
      render_json_validation_error @customer_category
    end
  end

  # PATCH/PUT /customer_categories/1
  def update
    if @customer_category.update(customer_category_params)
      render json: @customer_category, status: :accepted
    else
      render_json_validation_error @customer_category
    end
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
