class Dish < ApplicationRecord
  has_many :cook_logs, dependent: :destroy

  validates :name, presence: true
end
