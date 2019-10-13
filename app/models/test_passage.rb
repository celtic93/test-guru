class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: [:create, :update]

  scope :successed, -> { where(status: 'successed') }
  scope :by_test, -> (test) { where(test: test) }
  scope :by_level, -> (level) { joins(:test).where(tests: {level: level}) }
  scope :by_category, -> (category) { joins(:test).where(tests: {category: category}) }

  PASSING_SCORE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success_percent
    (self.correct_questions.fdiv(test.questions.count)*100).round
  end

  def success?
    success_percent >= PASSING_SCORE
  end

  def question_index
    test.questions.find_index(self.current_question)+1
  end

  def set_status
    self.status = success? ? 'successed' : 'failed'
    save!
  end

  def add_badges
    Badge.find_each do |badge|
      user.badges.push(badge) if badge.suitable?(self)
    end
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_current_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
