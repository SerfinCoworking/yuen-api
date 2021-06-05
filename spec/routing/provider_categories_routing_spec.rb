require "rails_helper"

RSpec.describe ProviderCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/provider_categories").to route_to("provider_categories#index")
    end

    it "routes to #show" do
      expect(get: "/provider_categories/1").to route_to("provider_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/provider_categories").to route_to("provider_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/provider_categories/1").to route_to("provider_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/provider_categories/1").to route_to("provider_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/provider_categories/1").to route_to("provider_categories#destroy", id: "1")
    end
  end
end
