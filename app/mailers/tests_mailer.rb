class TestsMailer < ApplicationMailer
  def completed_test(test_passing)
    @user = test_passing.user
    @test = test_passing.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
