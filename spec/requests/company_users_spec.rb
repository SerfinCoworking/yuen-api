require 'rails_helper'

RSpec.describe "/company_users", type: :request do
  let!(:company) { create(:company) }
  let!(:user) { create(:user) }

  let(:valid_attributes) {
    { user_id: User.first.id, company_id: Company.first.id }
  }

  let(:invalid_attributes) {
    { user_id: nil, company_id: nil }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      CompanyUser.create! valid_attributes
      get company_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company_user = CompanyUser.create! valid_attributes
      get company_user_url(company_user), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CompanyUser" do
        expect {
          post company_users_url,
               params: { company_user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(CompanyUser, :count).by(1)
      end

      it "renders a JSON response with the new company_user" do
        post company_users_url,
             params: { company_user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CompanyUser" do
        expect {
          post company_users_url,
               params: { company_user: invalid_attributes }, as: :json
        }.to change(CompanyUser, :count).by(0)
      end

      it "renders a JSON response with errors for the new company_user" do
        post company_users_url,
             params: { company_user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_user){ create(:user) }
      let(:new_attributes) {
        { user: new_user }
      }

      it "updates the requested company_user" do
        company_user = CompanyUser.create! valid_attributes
        patch company_user_url(company_user),
              params: { company_user: new_attributes }, headers: valid_headers, as: :json
        company_user.reload
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end

      it "renders a JSON response with the company_user" do
        company_user = CompanyUser.create! valid_attributes
        patch company_user_url(company_user),
              params: { company_user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the company_user" do
        company_user = CompanyUser.create! valid_attributes
        patch company_user_url(company_user),
              params: { company_user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company_user" do
      company_user = CompanyUser.create! valid_attributes
      expect {
        delete company_user_url(company_user), headers: valid_headers, as: :json
      }.to change(CompanyUser, :count).by(-1)
    end
  end
end
