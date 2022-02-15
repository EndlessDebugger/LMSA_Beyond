require "rails_helper"

RSpec.describe EventHistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/event_hists").to route_to("event_hists#index")
    end

    it "routes to #new" do
      expect(get: "/event_hists/new").to route_to("event_hists#new")
    end

    it "routes to #show" do
      expect(get: "/event_hists/1").to route_to("event_hists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event_hists/1/edit").to route_to("event_hists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/event_hists").to route_to("event_hists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event_hists/1").to route_to("event_hists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event_hists/1").to route_to("event_hists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event_hists/1").to route_to("event_hists#destroy", id: "1")
    end
  end
end
