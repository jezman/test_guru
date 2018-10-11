class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    render plain: @question.body
  end

  def create
    if @test.questions.create(question_params).save
      render plain: "Question '#{question_params[:body]}' created"
    else
      render plain: 'Creating error'
    end
  end

  def destroy
    @question.delete

    render plain: "Question '#{question_params[:body]}' deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
