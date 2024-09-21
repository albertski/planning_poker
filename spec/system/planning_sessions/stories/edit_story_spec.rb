require 'rails_helper'

RSpec.describe 'Editing Story', type: :system do
  let(:user) { create(:user) }
  let(:planning_session) { create(:planning_session, owner: user) }
  let!(:story) { create(:story, planning_session: planning_session, title: 'My long story') }

  before { login_as(user, scope: :user) }

  it 'allows a user to sign up' do
    visit planning_session_path(planning_session.uuid)
    assert_text 'My long story'

    find('a.edit-story-button').click

    fill_in 'Title', with: 'My updated story'
    click_on 'Save'

    assert_text 'My updated story'
  end
end
