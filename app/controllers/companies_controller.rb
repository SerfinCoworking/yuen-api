class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  def index
    @companies = Company.all

    json_response(@companies)
  end

  # GET /companies/1
  def show
    json_response(@company)
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render_json_validation_error @company
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company, status: :accepted
    else
      render_json_validation_error @company
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :web_page, :email, :address, :phone, :logo)
  end
end
