class Badge < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :path, presence: true
end
