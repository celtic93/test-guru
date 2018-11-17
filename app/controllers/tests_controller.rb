class TestsController < ApplicationController
  before_action :test_find, only: [:show]

  def index
    @tests = Test.all
  end

  def show
    
  end

  private

  def test_find
    @test = Test.find(params[:id])    
  end
end
