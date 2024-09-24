# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Story', type: :system do
  let(:user) { create(:user) }
  let(:planning_session) { create(:planning_session, owner: user) }
  let!(:story) { create(:story, planning_session: planning_session, title: 'My long story') }

  before { login_as(user, scope: :user) }

  it 'allows a user to delerte a story' do
    visit planning_session_path(planning_session.uuid)
    assert_text 'My long story'

    find('a.edit-story-button').click

    click_on 'Delete'

    have_no_text 'My long story'
  end
end
