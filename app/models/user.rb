class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
      .where(level: level, results: { user_id: id })
  end
end
