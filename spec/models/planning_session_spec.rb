require 'rails_helper'

RSpec.describe PlanningSession, type: :model do
  describe '.owned_by' do
    let(:planning_sessions) { create_list(:planning_session, 2) }

    subject { described_class.owned_by(planning_sessions.first.owner) }

    it 'returns only planning sessions with that owner' do
      expect(subject).to contain_exactly(planning_sessions.first)
    end
  end
end
