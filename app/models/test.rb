class Test < ApplicationRecord
  has_many :questions
  has_many :started_tests
  has_many :users, through: :started_tests
  belongs_to :category  
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins("INNER JOIN categories ON categories.id = tests.category_id")
                                      .where(categories: { title: category }).order(title: :desc).pluck(:title) }
end
