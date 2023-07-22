class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  enum :role, [:normal_user, :admin]
  def admin?
    role == "admin"
  end
  has_many :job_offers
  has_many :applications
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
  has_many :job_applications
  has_many :applied_job_offers, through: :job_applications, source: :job_offer
  has_one_attached :avatar, dependent: :destroy, service: :amazon
end
