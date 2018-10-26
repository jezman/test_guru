class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user
    @subject = feedback.title
    @message = feedback.body

    mail to: Admin.first.email, from: @user.email, subject: @subject
  end
end
