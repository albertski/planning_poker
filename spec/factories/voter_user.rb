# frozen_string_literal: true

FactoryBot.define do
  factory :voter_user, class: 'PlanningSessions::VoterUser' do
    planning_session { create(:planning_session) }
    user { create(:user) }
  end
end
