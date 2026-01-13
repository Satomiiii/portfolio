class Dish < ApplicationRecord
  belongs_to :user
  has_many :cook_logs, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
end
