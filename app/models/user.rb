class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def passed_tests_by_level(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
      .where(level: level, results: { user_id: id })
  end
end
