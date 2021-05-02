require 'rails_helper'

RSpec.describe "/products", type: :request do

  let!(:company) { create(:company) }
  let!(:category) { create(:product_category) }

  let(:valid_attributes) {
    {
      barcode: Faker::Barcode.ean(13),
      name: Faker::Vehicle.manufacture,
      description: Faker::Vehicle.standard_specs,
      company_id: company.id,
      category_id: category.id
    }
  }

  let(:invalid_attributes) {
    {    
      barcode: nil,
      name: nil,
      description: nil,
      company: nil,
      category: nil
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Product.create! valid_attributes
      get products_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get product_url(product), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product" do
        expect {
          post products_url,
               params: { product: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Product, :count).by(1)
      end

      it "renders a JSON response with the new product" do
        post products_url,
             params: { product: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product" do
        expect {
          post products_url,
               params: { product: invalid_attributes }, as: :json
        }.to change(Product, :count).by(0)
      end

      it "renders a JSON response with errors for the new product" do
        post products_url,
             params: { product: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { barcode: '12345' }
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        patch product_url(product),
              params: { product: new_attributes }, headers: valid_headers, as: :json
        product.reload
        expect(product).to have_attributes(barcode: '12345')
      end

      it "renders a JSON response with the product" do
        product = Product.create! valid_attributes
        patch product_url(product),
              params: { product: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the product" do
        product = Product.create! valid_attributes
        patch product_url(product),
              params: { product: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete product_url(product), headers: valid_headers, as: :json
      }.to change(Product, :count).by(-1)
    end
  end
end
