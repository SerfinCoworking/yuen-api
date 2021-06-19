class UnitiesController < ApplicationController
  before_action :set_unity, only: %i[show update destroy]

  # GET /unities
  def index
    @unities = Unity.by_company(current_user.current_company)

    json_response(@unities)
  end

  # GET /unities/1
  def show
    json_response(@unity)
  end

  # POST /unities
  def create
    @unity = Unity.create!(unity_params)

    json_response(@unity, :created)
  end

  # PATCH/PUT /unities/1
  def update
    @unity.update!(unity_params)

    json_response(@unity, :ok)
  end

  # DELETE /unities/1
  def destroy
    @unity.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unity
    @unity = Unity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def unity_params
    params.require(:unity).permit(:unity_type, :equivalence_type, :name, :symbol, :equivalence)
  end
end
