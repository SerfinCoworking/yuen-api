require 'rails_helper'
require 'swagger_helper'

RSpec.describe "/companies", type: :request do

  let(:valid_attributes) {
    { name: 'Tesla' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_headers) {
    {}
  }


  describe 'GET #index' do
    before { get companies_path }

    it { expect(response).to have_http_status(:success) }
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get company_url(company), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url,
               params: { company: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Company, :count).by(1)
      end

      it "renders a JSON response with the new company" do
        post companies_url,
             params: { company: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url,
               params: { company: invalid_attributes }, as: :json
        }.to change(Company, :count).by(0)
      end

      it "renders a JSON response with errors for the new company" do
        post companies_url,
             params: { company: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Microsoft' }
      }

      it "updates the requested company" do
        company = Company.create! valid_attributes
        patch company_url(company),
              params: { company: new_attributes }, headers: valid_headers, as: :json
        company.reload
        expect(response).to have_http_status(:ok)
        expect(company).to have_attributes(:name => "Microsoft")
      end

      it "renders a JSON response with the company" do
        company = Company.create! valid_attributes
        patch company_url(company),
              params: { company: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the company" do
        company = Company.create! valid_attributes
        patch company_url(company),
              params: { company: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete company_url(company), headers: valid_headers, as: :json
      }.to change(Company, :count).by(-1)
    end
  end
end
