class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :test_passings
  has_many :users, through: :test_passings
  has_many :questions

  def self.titles_by_category(title)
    join(:category).where(categories: { title: title })
                   .order(title: :desc).pluck(:title)
  end
end
