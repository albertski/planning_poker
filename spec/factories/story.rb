# frozen_string_literal: true

FactoryBot.define do
  factory :story, class: 'PlanningSessions::Story' do
    title { Faker::Name.name }
    planning_session { create(:planning_session) }
  end
end
