class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badge
  belongs_to :rule
  validates :name, presence: true
end
