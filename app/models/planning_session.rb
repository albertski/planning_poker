class PlanningSession < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  scope :owned_by, ->(user) { where(owner: user) }

  validates :name, presence: true
end
