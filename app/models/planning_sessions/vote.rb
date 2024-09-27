# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :story, class_name: 'PlanningSessions::Story'

  validates :user_id, uniqueness: { scope: :story_id, message: "Can only vote once per story" }

  has_one :planning_session, through: :voter_user
end
