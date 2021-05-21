require 'rails_helper'

RSpec.describe "/stock_locations", type: :request do
  let!(:company) { create(:company) }

  let(:valid_attributes) {
    {
      name: Faker::Address.state_abbr,
      company_id: company.id
    }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      StockLocation.create! valid_attributes
      get stock_locations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      stock_location = StockLocation.create! valid_attributes
      get stock_location_url(stock_location), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new StockLocation" do
        expect {
          post stock_locations_url,
               params: { stock_location: valid_attributes }, headers: valid_headers, as: :json
        }.to change(StockLocation, :count).by(1)
      end

      it "renders a JSON response with the new stock_location" do
        post stock_locations_url,
             params: { stock_location: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new StockLocation" do
        expect {
          post stock_locations_url,
               params: { stock_location: invalid_attributes }, as: :json
        }.to change(StockLocation, :count).by(0)
      end

      it "renders a JSON response with errors for the new stock_location" do
        post stock_locations_url,
             params: { stock_location: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Pasillo B estante 1' }
      }

      it "updates the requested stock_location" do
        stock_location = StockLocation.create! valid_attributes
        patch stock_location_url(stock_location),
              params: { stock_location: new_attributes }, headers: valid_headers, as: :json
        stock_location.reload
        expect(stock_location).to have_attributes(name: 'Pasillo B estante 1')
      end

      it "renders a JSON response with the stock_location" do
        stock_location = StockLocation.create! valid_attributes
        patch stock_location_url(stock_location),
              params: { stock_location: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the stock_location" do
        stock_location = StockLocation.create! valid_attributes
        patch stock_location_url(stock_location),
              params: { stock_location: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested stock_location" do
      stock_location = StockLocation.create! valid_attributes
      expect {
        delete stock_location_url(stock_location), headers: valid_headers, as: :json
      }.to change(StockLocation, :count).by(-1)
    end
  end
end
