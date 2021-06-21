class UnitiesController < ApplicationController
  before_action :set_unity, only: %i[show update destroy]

  # GET /unities
  def index
    @unities = Unity.all

    json_response(@unities)
  end

  # GET /unities/1
  def show
    json_response(@unity)
  end

  # POST /unities
  def create
    @unity = Unity.new(unity_params)

    if @unity.save
      render json: @unity, status: :created
    else
      render_json_validation_error @unity
    end
  end

  # PATCH/PUT /unities/1
  def update
    if @unity.update(unity_params)
      render json: @unity, status: :ok
    else
      render_json_validation_error @unity
    end
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
