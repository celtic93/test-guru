class Rule < ApplicationRecord
  has_many :badges, dependent: :nullify
  validates :name, presence: true
  validates :rule_type, presence: true

  def passes?(test_passage)
    case rule_type
    when 'first_try'
      first_try?(test_passage)
    when 'by_level'
      by_level?(test_passage)
    when 'by_category'
      by_category?(test_passage)
    else
      false
    end
  end

  private

  def first_try?(test_passage)
    test = test_passage.test
    test_passage.user.test_passages.by_test(test).count == 1 && test_passage.success?
  end

  def by_level?(test_passage)
    level = test_passage.test.level
    test_passages_by_level = test_passage.user.test_passages.successed.by_level(level).uniq
    tests_by_level = Test.by_level(level)

    test_passages_by_level.count == tests_by_level.count
  end

  def by_category?(test_passage)
    category = test_passage.test.category
    test_passages_by_category = test_passage.user.test_passages.successed.by_category(category).uniq
    tests_by_category = Test.by_category(category)

    test_passages_by_category.count == tests_by_category.count
  end
end
