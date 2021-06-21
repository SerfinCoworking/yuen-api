class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show update destroy]

  # GET /providers
  def index
    @providers = Provider.by_company(current_user.current_company)

    json_response(@providers)
  end

  # GET /providers/1
  def show
    json_response(@provider)
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)
    @provider.company = current_user.current_company

    if @provider.save
      render json: @provider, status: :created
    else
      render_json_validation_error @provider
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      render json: @provider, status: :ok
    else
      render_json_validation_error @provider
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_provider
    @provider = Provider.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def provider_params
    params.require(:provider).permit(:name, :email, :address, :phone, :cuit, :webpage, :category_id)
  end
end
