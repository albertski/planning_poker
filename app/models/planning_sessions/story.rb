# frozen_string_literal: true

module PlanningSessions
  class Story < ApplicationRecord
    belongs_to :planning_session

    enum status: { incomplete: 0, voting: 1, complete: 2 }

    after_create :update_planning_session_total_votes
    after_update :update_planning_session_total_votes
    after_destroy :update_planning_session_total_votes

    validates :title, presence: true

    private

    def update_planning_session_total_votes
      planning_session.update(total_votes: planning_session.stories.sum(:vote))
    end
  end
end
