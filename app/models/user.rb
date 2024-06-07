class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, length: { minimum: 2 }, presence: true
  validates :email, presence: true, uniqueness: true

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end