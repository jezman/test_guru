module TestPassingsHelper
  def show_result_message(test_passing)
    test_passing.successfully_completed? ? t('test_passings.result.success') : t('test_passings.result.failed')
  end

  def set_result_color(test_passing)
    test_passing.successfully_completed? ? 'success' : 'fail'
  end
end
