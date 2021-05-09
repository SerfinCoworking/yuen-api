require "rails_helper"

RSpec.describe CompanyUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/company_users").to route_to("company_users#index")
    end

    it "routes to #show" do
      expect(get: "/company_users/1").to route_to("company_users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/company_users").to route_to("company_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/company_users/1").to route_to("company_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/company_users/1").to route_to("company_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/company_users/1").to route_to("company_users#destroy", id: "1")
    end
  end
end
