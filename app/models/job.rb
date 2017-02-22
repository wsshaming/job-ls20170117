class Job < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :职缺, presence: true
end
