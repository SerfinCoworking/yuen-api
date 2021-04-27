class AccountsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.all

    json_response(@accounts)
  end

  # GET /accounts/1
  def show
    json_response(@account)
  end

  # POST /accounts
  def create
    @account = Account.create!(account_params)

    json_response(@account, :created)
  end

  # PATCH/PUT /accounts/1
  def update
    @account.update!(account_params)
    json_response(@account, :ok)
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :account_alias, :cbu, :description, :balance, :user_id, :account_type_id)
    end
end
