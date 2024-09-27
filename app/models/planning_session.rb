# frozen_string_literal: true

class PlanningSession < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :stories, class_name: 'PlanningSessions::Story', dependent: :destroy
  has_many :voter_users, class_name: 'PlanningSessions::VoterUser', dependent: :destroy
  has_many :users, through: :voter_users
  has_many :votes, through: :voter_users

  scope :owned_by, ->(user) { where(owner: user) }

  validates :name, presence: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
