require "rails_helper"

RSpec.describe ProductLocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product_locations").to route_to("product_locations#index")
    end

    it "routes to #show" do
      expect(get: "/product_locations/1").to route_to("product_locations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product_locations").to route_to("product_locations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product_locations/1").to route_to("product_locations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product_locations/1").to route_to("product_locations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product_locations/1").to route_to("product_locations#destroy", id: "1")
    end
  end
end
