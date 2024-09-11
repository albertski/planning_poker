# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deleting Planning Session', type: :system do
  let(:user) { create(:user) }
  let!(:planning_session) { create(:planning_session, name: 'November 2024 Spring', owner: user) }

  before { login_as(user, scope: :user) }

  it 'deletes the planning session' do
    visit planning_sessions_path
    assert_text planning_session.name

    page.accept_confirm do
      click_on 'Delete'
    end

    assert_no_text planning_session.name
  end
end
