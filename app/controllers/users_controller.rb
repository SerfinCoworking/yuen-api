class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # GET /users/1
  def show
    json_response(@user)
  end

  # POST /users
  def register
    @user = User.create!(user_params)

    json_response(@user, :created)
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)

    json_response(@user, :ok)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email_verified, :email, :auth0_id, :username, :phone_number, :phone_verified,
                                 :picture, :name, :nickname, :blocked, :given_name, :family_name, :current_company_id
    )
  end
end
