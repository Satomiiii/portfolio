class CookLog < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  validates :trial_number, presence: true
  validates :reflection, presence: true
  validates :next_plan, presence: true
end
