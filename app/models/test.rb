class Test < ApplicationRecord
  has_many :questions
  has_many :started_tests
  has_many :users, through: :started_tests
  belongs_to :category  
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level, message: 'This test is already exists' }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
