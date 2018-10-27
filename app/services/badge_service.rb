class BadgeService
  def initialize(test_passing)
    @test_passing = test_passing
    @test = test_passing.test
    @user = test_passing.user
  end

  def check
    Badge.all.each do |badge|
      case badge.assigment_rule
      when 'all_category_tests' then award(badge, all_category_tests?(badge.category))
      when 'test_first_try' then award(badge, test_first_try?)
      when 'all_level_tests' then award(badge, all_level_tests?(badge.level))
      end
    end
  end

  private

  def all_category_tests?(category)
    return false unless @test.category.title == category.title
    category.tests.count == count_category_tests(category)
  end

  def test_first_try?
    (@test_passing.successfully_completed? &&
    TestPassing.where(user: @user, test: @test).count == 1)
  end

  def all_level_tests?(level)
    Test.by_level(level).count == successed_user_tests.map(&:test).map(&:level).count(level)
  end

  def successed_user_tests
    TestPassing.successed_tests_by_user(@user)
  end

  def count_category_tests(category)
    successed_user_tests.map(&:test).map(&:category).map(&:title).count(category.title)
  end

  def award(badge, rule)
    @user.badges << badge if rule
  end
end
