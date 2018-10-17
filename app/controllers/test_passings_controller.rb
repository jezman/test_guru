class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_passing.accept!(params[:answer_ids])

    if @test_passing.completed?
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end
end
