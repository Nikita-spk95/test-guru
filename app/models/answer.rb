class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :correct, inclusion: [true, false]
  validate :check_answers_count, on: :create

  scope :correct, -> { where(correct: true) }
  
  private

  def check_answers_count
    errors.add(:base, "the question must have from 1 to 4 answers") if question.answers.count >= 4 
  end
end
