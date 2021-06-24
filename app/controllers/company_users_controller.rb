class CompanyUsersController < ApplicationController
  before_action :set_company_user, only: %i[show update destroy]

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
    @company_user = CompanyUser.new(company_user_params)

    if @company_user.save
      render json: @company_user, status: :created
    else
      render_json_validation_error @company_user
    end
  end

  # PATCH/PUT /company_users/1
  def update
    if @company_user.update(company_user_params)
      render json: @company_user, status: :accepted
    else
      render_json_validation_error @company_user
    end
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
