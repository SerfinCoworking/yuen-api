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
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render_json_validation_error @user
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render_json_validation_error @user
    end
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
