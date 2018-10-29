class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :test_passings
  has_many :users, through: :test_passings
  has_many :questions

  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: 'there can be only one test with this title and difficulty level'
  }
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  # validates :time_limit, numericality: {
  #   only_integer: true,
  #   greater_than_or_equal_to: 1
  # }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
