class User < ApplicationRecord

  def tests_by_level(level)
    test_ids = StartedTest.where(user_id: self.id).pluck(:test_id)
    Test.where(level: level).where(id: test_ids).pluck(:title)
  end
end
