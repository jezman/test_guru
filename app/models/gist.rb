class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def hash
    url.split("/").last
  end
end
