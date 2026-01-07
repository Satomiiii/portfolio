class Dish < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :category, presence: true, length: { maximum: 50 }
  validates :memo, length: { maximum: 2000 }, allow_blank: true
end
