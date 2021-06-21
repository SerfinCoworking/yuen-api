class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show update destroy]

  # GET /customers
  def index
    @customers = Customer.by_company(current_user.current_company)

    json_response(@customers)
  end

  # GET /customers/1
  def show
    json_response(@customer)
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @customer.company = current_user.current_company

    if @customer.save
      render json: @customer, status: :created
    else
      render_json_validation_error @customer
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer, status: :ok
    else
      render_json_validation_error @customer
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :nickname, :address, :phone, :cuit, :email, :category_id, 
                                     :organization)
  end
end
