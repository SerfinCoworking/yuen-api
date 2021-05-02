require 'rails_helper'
require 'swagger_helper'

RSpec.describe "/product_categories", type: :request do

  let(:valid_attributes) {
    { name: Faker::Vehicle.car_type }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      ProductCategory.create! valid_attributes
      get product_categories_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product_category = ProductCategory.create! valid_attributes
      get product_category_url(product_category), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ProductCategory" do
        expect {
          post product_categories_url,
               params: { product_category: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ProductCategory, :count).by(1)
      end

      it "renders a JSON response with the new product_category" do
        post product_categories_url,
             params: { product_category: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ProductCategory" do
        expect {
          post product_categories_url,
               params: { product_category: invalid_attributes }, as: :json
        }.to change(ProductCategory, :count).by(0)
      end

      it "renders a JSON response with errors for the new product_category" do
        post product_categories_url,
             params: { product_category: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Gaseosa' }
      }

      it "updates the requested product_category" do
        product_category = ProductCategory.create! valid_attributes
        patch product_category_url(product_category),
              params: { product_category: new_attributes }, headers: valid_headers, as: :json
        product_category.reload
        expect(product_category).to have_attributes(name: 'Gaseosa')
      end

      it "renders a JSON response with the product_category" do
        product_category = ProductCategory.create! valid_attributes
        patch product_category_url(product_category),
              params: { product_category: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the product_category" do
        product_category = ProductCategory.create! valid_attributes
        patch product_category_url(product_category),
              params: { product_category: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product_category" do
      product_category = ProductCategory.create! valid_attributes
      expect {
        delete product_category_url(product_category), headers: valid_headers, as: :json
      }.to change(ProductCategory, :count).by(-1)
    end
  end
end
