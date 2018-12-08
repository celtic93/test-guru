class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true
  validates :url_hash, presence: true
end
