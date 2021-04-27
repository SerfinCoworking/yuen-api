class AccountTypesController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_account_type, only: [:show, :update, :destroy]

  # GET /account_types
  def index
    @account_types = AccountType.all

    json_response(@account_types)
  end

  # GET /account_types/1
  def show
    json_response(@account_type)
  end

  # POST /account_types
  def create
    @account_type = AccountType.create!(account_type_params)

    json_response(@account_type, :created)
  end

  # PATCH/PUT /account_types/1
  def update
    @account_type.update!(account_type_params)

    json_response(@account_type, :ok)
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
      params.require(:account_type).permit(:name)
    end
end
