class CompanyUsersController < ApplicationController
  before_action :set_company_user, only: [:show, :update, :destroy]

  # GET /company_users
  def index
    @company_users = CompanyUser.all

    json_response(@company_users)
  end

  # GET /company_users/1
  def show
    json_response(@company_user)
  end

  # POST /company_users
  def create
    @company_user = CompanyUser.create!(company_user_params)
    
    json_response(@company_user, :created)
  end

  # PATCH/PUT /company_users/1
  def update
    @company_user.update!(company_user_params)
    
    json_response(@company_user, :ok)
  end

  # DELETE /company_users/1
  def destroy
    @company_user.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_user
      @company_user = CompanyUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_user_params
      params.require(:company_user).permit(:user_id, :company_id)
    end
end
