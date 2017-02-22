class Job < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :职缺, presence: true


  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user
end
