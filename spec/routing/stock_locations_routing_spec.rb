require "rails_helper"

RSpec.describe StockLocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stock_locations").to route_to("stock_locations#index")
    end

    it "routes to #show" do
      expect(get: "/stock_locations/1").to route_to("stock_locations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stock_locations").to route_to("stock_locations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stock_locations/1").to route_to("stock_locations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stock_locations/1").to route_to("stock_locations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stock_locations/1").to route_to("stock_locations#destroy", id: "1")
    end
  end
end
