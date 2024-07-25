module QuestionsHelper
  def question_header
    test_title = @question.test.title
    @question.new_record? ? "<#{test_title}>" : "<#{test_title}>"
  end
end
