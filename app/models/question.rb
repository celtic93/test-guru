class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:question, 'The number of answers should be no more than 4')
  end
end
