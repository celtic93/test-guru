class User < ApplicationRecord

  def tests_by_level(level)
    Test.joins("INNER JOIN started_tests ON started_tests.test_id = tests.id")
        .where("tests.level = ? AND user_id = ?", level, self.id).pluck(:title)
  end
end
