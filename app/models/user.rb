class User < ApplicationRecord
  has_many :started_tests
  has_many :tests, through: :started_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    Test.joins("INNER JOIN started_tests ON started_tests.test_id = tests.id")
        .where(started_tests: { user_id: id }).where(level: level)
  end
end
