class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_tests_by_level, -> { where(level: 0..1) }
  scope :medium_tests_by_level, -> { where(level: 2..4) }
  scope :hard_tests_by_level, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, ->(category) { 
    joins(:category)
      .where(categories: { title: category }) 
      .order(title: :desc)
  }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end
end
