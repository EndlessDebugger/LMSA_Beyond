require "rails_helper"

RSpec.describe PoinEventsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/poin_events").to route_to("poin_events#index")
    end

    it "routes to #new" do
      expect(get: "/poin_events/new").to route_to("poin_events#new")
    end

    it "routes to #show" do
      expect(get: "/poin_events/1").to route_to("poin_events#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/poin_events/1/edit").to route_to("poin_events#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/poin_events").to route_to("poin_events#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/poin_events/1").to route_to("poin_events#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/poin_events/1").to route_to("poin_events#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/poin_events/1").to route_to("poin_events#destroy", id: "1")
    end
  end
end
