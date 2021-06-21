class ProviderCategoriesController < ApplicationController
  before_action :set_provider_category, only: [:show, :update, :destroy]

  # GET /provider_categories
  def index
    @provider_categories = ProviderCategory.by_company(current_user.current_company)

    json_response(@provider_categories)
  end

  # GET /provider_categories/1
  def show
    json_response(@provider_category)
  end

  # POST /provider_categories
  def create
    @provider_category = ProviderCategory.new(provider_category_params)
    @provider_category.company = current_user.current_company

    if @provider_category.save
      render json: @provider_category, status: :created
    else
      render_json_validation_error @provider_category
    end
  end

  # PATCH/PUT /provider_categories/1
  def update
    if @provider_category.update(provider_category_params)
      render json: @provider_category, status: :ok
    else
      render_json_validation_error @provider_category
    end
  end

  # DELETE /provider_categories/1
  def destroy
    @provider_category.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_provider_category
    @provider_category = ProviderCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def provider_category_params
    params.require(:provider_category).permit(:name, :description)
  end
end
