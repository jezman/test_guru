class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passings
  has_many :users, through: :test_passings

  def self.titles_by_category(title)
    join(:category).where(categories: { title: title })
                   .order(title: :desc).pluck(:title)
  end
end
