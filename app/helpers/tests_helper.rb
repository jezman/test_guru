module TestsHelper
  TEST_LEVELS = { 1 => :easy, 2 => :medium, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
