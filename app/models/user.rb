class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dishes, dependent: :destroy
  has_many :cook_logs, dependent: :destroy
end
