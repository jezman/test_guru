class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, alert: t('.success')
    else
      render :new, alert: t('.failed')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user, :title, :body)
  end
end
