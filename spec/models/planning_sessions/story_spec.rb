# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlanningSessions::Story, type: :model do
  let(:planning_session) { create(:planning_session) }

  describe '#update_planning_session_total_votes' do
    it 'updates total_votes when a story is created' do
      create(:story, planning_session: planning_session, vote: 5)

      expect(planning_session.reload.total_votes).to eq(5)
    end

    it 'updates total_votes when a story is updated' do
      story = create(:story, planning_session: planning_session, vote: 5)
      story.update(vote: 8)

      expect(planning_session.reload.total_votes).to eq(8)
    end

    it 'updates total_votes when a story is destroyed' do
      story = create(:story, planning_session: planning_session, vote: 5)
      story.destroy

      expect(planning_session.reload.total_votes).to eq(0)
    end

    it 'sums total_votes correctly when multiple stories are present' do
      create(:story, planning_session: planning_session, vote: 5)
      create(:story, planning_session: planning_session, vote: 3)

      expect(planning_session.reload.total_votes).to eq(8)
    end
  end
end
