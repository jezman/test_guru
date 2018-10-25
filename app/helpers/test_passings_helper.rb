module TestPassingsHelper
  def show_result_message(test_passing)
    test_passing.successfully_completed? ? t('test_passings.result.success') : t('test_passings.result.failed')
  end

  def result_color(test_passing)
    test_passing.successfully_completed? ? 'text-success' : 'text-danger'
  end
end
