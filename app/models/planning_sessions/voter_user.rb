# frozen_string_literal: true

module PlanningSessions
  class VoterUser < ApplicationRecord
    belongs_to :user
    belongs_to :planning_session

    has_many :votes

    validates :user_id, uniqueness: { scope: :planning_session_id, message: 'can only be a voter once per session' }

    after_create_commit do
      broadcast_append_to 'voter-users', partial: 'planning_sessions/voter_users/voter_user',
                                         locals: { voter_user: self }
    end
  end
end
