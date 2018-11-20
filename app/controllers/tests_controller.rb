class TestsController < ApplicationController
  before_action :test_find, only: %i[show start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passages(@test)
  end

  private

  def test_find
    @test = Test.find(params[:id])    
  end

  def set_user
    @user = User.first
  end
end
