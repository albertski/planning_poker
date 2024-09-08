require 'rails_helper'

RSpec.describe "/planning_sessions", type: :request do
  let(:valid_attributes) { { name: 'First Sprint', owner: user} }
  let(:invalid_attributes) { { name: nil } }
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /index" do
    it "renders a successful response" do
      PlanningSession.create! valid_attributes
      get planning_sessions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      planning_session = PlanningSession.create! valid_attributes
      get planning_session_url(planning_session)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_planning_session_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      planning_session = PlanningSession.create! valid_attributes
      get edit_planning_session_url(planning_session)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PlanningSession" do
        expect {
          post planning_sessions_url, params: { planning_session: valid_attributes }
        }.to change(PlanningSession, :count).by(1)
      end

      it "redirects to the created planning_session" do
        post planning_sessions_url, params: { planning_session: valid_attributes }
        expect(response).to redirect_to(planning_session_url(PlanningSession.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PlanningSession" do
        expect {
          post planning_sessions_url, params: { planning_session: invalid_attributes }
        }.to change(PlanningSession, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post planning_sessions_url, params: { planning_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: 'Second Sprint'} }

      it "updates the requested planning_session" do
        planning_session = PlanningSession.create! valid_attributes
        patch planning_session_url(planning_session), params: { planning_session: new_attributes }
        planning_session.reload
        expect(planning_session.name).to eq(new_attributes[:name])
      end

      it "redirects to the planning_session" do
        planning_session = PlanningSession.create! valid_attributes
        patch planning_session_url(planning_session), params: { planning_session: new_attributes }
        planning_session.reload
        expect(response).to redirect_to(planning_session_url(planning_session))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        planning_session = PlanningSession.create! valid_attributes
        patch planning_session_url(planning_session), params: { planning_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested planning_session" do
      planning_session = PlanningSession.create! valid_attributes
      expect {
        delete planning_session_url(planning_session)
      }.to change(PlanningSession, :count).by(-1)
    end

    it "redirects to the planning_sessions list" do
      planning_session = PlanningSession.create! valid_attributes
      delete planning_session_url(planning_session)
      expect(response).to redirect_to(planning_sessions_url)
    end
  end
end
