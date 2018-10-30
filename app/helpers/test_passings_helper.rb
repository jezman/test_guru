module TestPassingsHelper
  def show_result_message(test_passing)
    fail = test_passing.time_out? ? t('test_passings.result.time_failed') : t('test_passings.result.failed')
    test_passing.successfully_completed? ? t('test_passings.result.success') : fail
  end

  def result_color(test_passing)
    test_passing.successfully_completed? ? 'text-success' : 'text-danger'
  end

  def show_timer(test_passing)
    ((test_passing.created_at + test_passing.test.time_limit.minutes) - Time.current).to_i
  end  
end
