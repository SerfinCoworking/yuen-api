require 'rails_helper'

RSpec.describe 'accounts API', type: :request do
  # initialize test data 
  
  let!(:account_type) { create(:account_type) }

  let(:valid_attributes) { 
    { 
      name: "Efectivo", 
      cbu: Faker::Bank.account_number(digits: 22), 
      description: "Cuenta",
      balance: Faker::Number.number(digits: 5),
      user_id: 1,
      account_type_id: account_type.id
    } 
  }

  let(:invalid_attributes) { 
    { name: nil, cbu: nil, description: nil, balance: nil, user_id: nil, account_type: nil } 
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Account.create! valid_attributes
      get accounts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      account = Account.create! valid_attributes
      get account_url(account), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Account" do
        expect {
          post accounts_url,
                params: { account: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Account, :count).by(1)
      end

      it "renders a JSON response with the new account" do
        post accounts_url,
              params: { account: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Account" do
        expect {
          post accounts_url,
                params: { account: invalid_attributes }, as: :json
        }.to change(Account, :count).by(0)
      end

      it "renders a JSON response with errors for the new account" do
        post accounts_url,
              params: { account: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Billetera" }
      }

      it "updates the requested account" do
        account = Account.create! valid_attributes
        patch account_url(account),
              params: { account: new_attributes }, headers: valid_headers, as: :json
        account.reload
        expect(account).to have_attributes(name: "Billetera")      
      end

      it "renders a JSON response with the account" do
        account = Account.create! valid_attributes
        patch account_url(account),
              params: { account: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the account" do
        account = Account.create! valid_attributes
        patch account_url(account),
              params: { account: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested account" do
      account = Account.create! valid_attributes
      expect {
        delete account_url(account), headers: valid_headers, as: :json
      }.to change(Account, :count).by(-1)
    end
  end
end
  