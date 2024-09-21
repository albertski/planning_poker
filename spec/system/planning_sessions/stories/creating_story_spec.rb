require 'rails_helper'

RSpec.describe 'Creating Story', type: :system do
  let(:user) { create(:user) }
  let(:planning_session) { create(:planning_session, owner: user) }

  before { login_as(user, scope: :user) }

  it 'allows a user to sign up' do
    visit planning_session_path(planning_session.uuid)
    click_on '+'

    fill_in 'Title', with: 'My first story'
    click_on 'Save'

    assert_text 'My first story'
  end
end
