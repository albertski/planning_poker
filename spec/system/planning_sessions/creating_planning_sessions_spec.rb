require 'rails_helper'

RSpec.describe 'Creating Planning Session', type: :system do
  let(:user) { create(:user) }

  before { login_as(user, scope: :user) }

  it 'allows a user to sign up' do
    visit planning_sessions_path
    assert_selector 'h1', text: 'Planning Sessions'

    click_on 'Create New Planning Session'

    fill_in 'Name', with: 'July 1st Sprint'
    click_on 'Save'

    # assert_text 'July 1st Sprint'
  end
end
