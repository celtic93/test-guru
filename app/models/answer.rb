class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question, 'The number of answers should be no more than 4') if question.answers.count >= 4
  end
end
