class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :posts


  has_many :job_relationships
  has_many :participated_jobs, :through => :job_relationships, :source => :job

    def is_member_of?(job)
      participated_jobs.include?(job)
    end
end
