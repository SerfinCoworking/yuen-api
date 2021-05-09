class CompaniesController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_company, only: [:show, :update, :destroy]

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
    @company = Company.create!(company_params)

    json_response(@company, :created)
  end

  # PATCH/PUT /companies/1
  def update
    @company.update!(company_params)

    json_response(@company, :ok)
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
      params.require(:company).permit(:name)
    end
end
