class QuestionsController < ApplicationController

  before_action :test_find, only: [:index, :create, :new]
  before_action :question_find, only: [:show, :delete, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound,
    with: :rescue_question_not_found

  def index
    redirect_to @test
  end

  def show

  end

  def new
    @question = @test.questions.new
  end

  def edit
    
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @test
  end

  private

  def question_params
    params.require(:question).permit(:body)
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
