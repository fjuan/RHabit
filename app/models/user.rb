class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  has_many :challenges, dependent: :destroy
  has_many :milestones, through: :challenges
  has_many :chronicles, dependent: :destroy
  has_many :meals,      dependent: :destroy
  has_many :payments,   dependent: :destroy
  has_many :workouts,   dependent: :destroy
end
