require 'rails_helper'

RSpec.describe '/planning_sessions/:planning_session_uuid/stories', type: :request do
  let(:user) { create(:user) }
  let(:planning_session) { create(:planning_session) }
  let(:valid_attributes) { { title: 'Story 1', planning_session: planning_session } }
  let(:invalid_attributes) { { updated_at: nil } }

  before { sign_in user }

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_planning_session_story_url(planning_session.uuid)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      story = PlanningSessions::Story.create! valid_attributes
      get edit_planning_session_story_url(planning_session.uuid, story)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      it 'does not create a new Story' do
        expect {
          post planning_session_stories_url(planning_session.uuid), params: { story: invalid_attributes }
        }.to change(PlanningSessions::Story, :count).by(0)
      end

      it "renders a response with 422 status (i.e., to display the 'new' template)" do
        post planning_session_stories_url(planning_session.uuid), params: { story: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested story' do
      story = PlanningSessions::Story.create! valid_attributes
      expect {
        delete planning_session_story_url(planning_session.uuid, story)
      }.to change(PlanningSessions::Story, :count).by(-1)
    end

    it 'redirects to the planning session page' do
      story = PlanningSessions::Story.create! valid_attributes
      delete planning_session_story_url(planning_session.uuid, story)
      expect(response).to redirect_to(planning_session_url(planning_session.uuid))
    end
  end
end
