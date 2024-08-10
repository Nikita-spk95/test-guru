class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
      
      current_user.gists.create!(url: result.gist_url,
                   user: @test_passage.user,
                   question: @test_passage.current_question)
      { notice: t('.success', url: result.gist_url) }
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
