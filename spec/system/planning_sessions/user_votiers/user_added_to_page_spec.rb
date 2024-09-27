# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User added to planning session on planning session load', type: :system do
  let(:user) { create(:user) }
  let(:planning_session) { create(:planning_session, owner: user) }

  before do
    Capybara.using_session(:first_user) do
      login_as(user, scope: :user)
      visit planning_session_path(planning_session.uuid)

      expect(page).to have_text(planning_session.name)
    end
  end

  context 'when a second user accesses the planning session' do
    let(:user2) { create(:user) }

    it 'displays the new user in real-time for the first user' do
      Capybara.using_session(:second_user) do
        login_as(user2, scope: :user)
        visit planning_session_path(planning_session.uuid)

        expect(page).to have_text(user2.first_name)
        expect(page).to have_text(user2.last_name)
      end

      Capybara.using_session(:first_user) do
        expect(page).to have_text(user2.first_name, wait: 5)
        expect(page).to have_text(user2.last_name)
      end
    end
  end
end
