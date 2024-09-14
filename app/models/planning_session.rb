class PlanningSession < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  before_create :generate_uuid

  scope :owned_by, ->(user) { where(owner: user) }

  validates :name, presence: true

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
