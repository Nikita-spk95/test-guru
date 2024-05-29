class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.titles_by_category(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
