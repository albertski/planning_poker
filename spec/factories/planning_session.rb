# frozen_string_literal: true

FactoryBot.define do
  factory :planning_session do
    name { Faker::Name.name }
    owner { create(:user) }
  end
end
