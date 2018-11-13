class QuestionsController < ApplicationController

  before_action :test_find, only: [:index, :create]
  before_action :question_find, only: [:show, :delete]

  rescue_from ActiveRecord::RecordNotFound,
    with: :rescue_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show    
    render plain: @question.inspect    
  end

  def new

  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: question.inspect
    else
      render plain: 'The question is not created. Wrong data'
    end
  end

  def delete
    @question.destroy
    render plain: 'The question was deleted from test'
  end

  private

  def question_params
    params.permit(:body, :test_id)
  end

  def test_find
    @test = Test.find(params[:test_id])
  end

  def question_find
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: 'Not found'
  end
end
