class AccountsController < ApplicationController
  before_action :set_account, only: %i[show update destroy]

  # GET /accounts
  def index
    @accounts = Account.by_company(current_user.current_company)

    json_response(@accounts)
  end

  # GET /accounts/1
  def show
    json_response(@account)
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @account.company = current_user.current_company

    if @account.save
      render json: @account, status: :created
    else
      render_json_validation_error @account
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account, status: :accepted
    else
      render_json_validation_error @account
    end
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
