class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]

  # GET /providers
  def index
    @providers = Provider.all

    json_response(@providers)
  end

  # GET /providers/1
  def show
    json_response(@provider)
  end

  # POST /providers
  def create
    @provider = Provider.create!(provider_params)
    
    json_response(@product, :created)
  end

  # PATCH/PUT /providers/1
  def update
    @provider.update!(provider_params)
    
    json_response(@product, :ok)
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
      params.require(:provider).permit(:name, :email, :address, :phone, :cuit)
    end
end