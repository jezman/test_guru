class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing
  before_action :check_passing_time, only: :update

  def show; end

  def result; end

  def update
    @test_passing.accept!(params[:answer_ids])

    if @test_passing.completed?
      BadgeService.new(@test_passing).check
      TestsMailer.completed_test(@test_passing).deliver_now
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passing.current_question)
    response = service.call

    gist_url = response.html_url
    gist_link = view_context.link_to(gist_url, gist_url, target: :blank)

    flash_message = if service.status_ok?
                      create_gist!(gist_url)
                      { notice: t('.success', url: gist_link) }
                    else
                      { alert: t('.failed') }
                    end

    redirect_to @test_passing, flash_message
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end

  def create_gist!(gist_url)
    current_user.gists.create(question: @test_passing.current_question, url: gist_url)
  end

  def check_passing_time
    return unless @test_passing.time_out?
    # TestsMailer.completed_test(@test_passing).deliver_now
    redirect_to result_test_passing_path(@test_passing)
  end

  
end
