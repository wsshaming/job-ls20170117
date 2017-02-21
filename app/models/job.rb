class Job < ApplicationRecord
  belongs_to :user
  validates :职缺, presence: true
end
