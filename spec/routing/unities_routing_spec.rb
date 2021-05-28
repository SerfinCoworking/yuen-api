require "rails_helper"

RSpec.describe UnitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/unities").to route_to("unities#index")
    end

    it "routes to #show" do
      expect(get: "/unities/1").to route_to("unities#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/unities").to route_to("unities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/unities/1").to route_to("unities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/unities/1").to route_to("unities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/unities/1").to route_to("unities#destroy", id: "1")
    end
  end
end
