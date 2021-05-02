require 'rails_helper'
require 'swagger_helper'

RSpec.describe "/account_types", type: :request do
  let(:valid_attributes) { 
    { name: "Efectivo" } 
  }

  let(:invalid_attributes) { 
    { name: nil } 
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      AccountType.create! valid_attributes
      get account_types_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      account_type = AccountType.create! valid_attributes
      get account_type_url(account_type), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AccountType" do
        expect {
          post account_types_url,
               params: { account_type: valid_attributes }, headers: valid_headers, as: :json
        }.to change(AccountType, :count).by(1)
      end

      it "renders a JSON response with the new account_type" do
        post account_types_url,
             params: { account_type: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AccountType" do
        expect {
          post account_types_url,
               params: { account_type: invalid_attributes }, as: :json
        }.to change(AccountType, :count).by(0)
      end

      it "renders a JSON response with errors for the new account_type" do
        post account_types_url,
             params: { account_type: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Cheques' }
      }

      it "updates the requested account_type" do
        account_type = AccountType.create! valid_attributes
        patch account_type_url(account_type),
              params: { account_type: new_attributes }, headers: valid_headers, as: :json
        account_type.reload
        expect(response).to have_http_status(:ok)
        expect(account_type).to have_attributes(:name => "Cheques")
      end

      it "renders a JSON response with the account_type" do
        account_type = AccountType.create! valid_attributes
        patch account_type_url(account_type),
              params: { account_type: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the account_type" do
        account_type = AccountType.create! valid_attributes
        patch account_type_url(account_type),
              params: { account_type: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested account_type" do
      account_type = AccountType.create! valid_attributes
      expect {
        delete account_type_url(account_type), headers: valid_headers, as: :json
      }.to change(AccountType, :count).by(-1)
    end
  end
end
