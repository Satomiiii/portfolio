class CookLog < ApplicationRecord
  belongs_to :dish

  validates :trial_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :reflection, presence: true
  validates :next_plan, presence: true
end
