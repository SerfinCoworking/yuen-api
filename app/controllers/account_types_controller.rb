class AccountTypesController < ApplicationController
  before_action :set_account_type, only: %i[show update destroy]

  # GET /account_types
  def index
    @account_types = AccountType.by_company(current_user.company)

    json_response(@account_types)
  end

  # GET /account_types/1
  def show
    json_response(@account_type)
  end

  # POST /account_types
  def create
    @account_type = AccountType.new(account_type_params)
    @account_type.company = current_user.current_company

    if @account_type.save
      render json: @account_type, status: :created
    else
      render_json_validation_error @account_type
    end
  end

  # PATCH/PUT /account_types/1
  def update
    @account_type.update!(account_type_params)

    json_response(@account_type, :accepted)
  end

  # DELETE /account_types/1
  def destroy
    @account_type.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account_type
    @account_type = AccountType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_type_params
    params.require(:account_type).permit(:name, :company_id)
  end
end
