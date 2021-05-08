class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :update, :destroy]

  
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
  def create
    @user = User.create!(user_params)

    json_response(@user, :created)
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)

    json_response(@user, :updated)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
end
