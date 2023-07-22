class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :images, as: :imageable
  has_many :applicants, through: :job_applications, source: :user
  has_many :job_applications  # Make sure this line is added
  has_many :applicants, through: :job_applications, source: :user
end
