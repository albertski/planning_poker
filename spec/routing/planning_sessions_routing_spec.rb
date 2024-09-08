require "rails_helper"

RSpec.describe PlanningSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/planning_sessions").to route_to("planning_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/planning_sessions/new").to route_to("planning_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/planning_sessions/1").to route_to("planning_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/planning_sessions/1/edit").to route_to("planning_sessions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/planning_sessions").to route_to("planning_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/planning_sessions/1").to route_to("planning_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/planning_sessions/1").to route_to("planning_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/planning_sessions/1").to route_to("planning_sessions#destroy", id: "1")
    end
  end
end
