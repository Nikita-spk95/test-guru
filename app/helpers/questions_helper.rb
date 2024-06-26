module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    question.new_record? ? "Create <#{test_title}> New Question" : "Edit <#{test_title}> Question"
  end
end
