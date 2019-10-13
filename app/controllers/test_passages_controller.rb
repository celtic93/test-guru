class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :check_timeout, only: %i[show update]

  def show

  end

  def result
    
  end

  def update
    Timeout::timeout(@test_passage.test.timer_value.seconds) do
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        @test_passage.set_status
        @test_passage.add_badges
        
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    rescue Timeout::error
      check_timeout
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    service.call

    @gist = current_user.gists.new(question: @test_passage.current_question,
                                    url: service.result[:html_url], url_hash: service.result[:id])

    flash_options = if @gist.save && service.success_call?
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

  def check_timeout
    if @test_passage.timeout?
      render :result
    end
  end
end
