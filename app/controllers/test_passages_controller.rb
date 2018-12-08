class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show

  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_question_service.call

    @gist = current_user.gists.new(question: @test_passage.current_question,
                                    url: result[:html_url], url_hash: result[:id])

    flash_options = if @gist.save && gist_question_service.success?
      { notice: "#{t('.success')} #{@gist.url}" }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
