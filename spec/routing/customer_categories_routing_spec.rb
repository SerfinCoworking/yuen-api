require "rails_helper"

RSpec.describe CustomerCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/customer_categories").to route_to("customer_categories#index")
    end

    it "routes to #show" do
      expect(get: "/customer_categories/1").to route_to("customer_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/customer_categories").to route_to("customer_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/customer_categories/1").to route_to("customer_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/customer_categories/1").to route_to("customer_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/customer_categories/1").to route_to("customer_categories#destroy", id: "1")
    end
  end
end
