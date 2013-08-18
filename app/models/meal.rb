class Meal < ActiveRecord::Base

  KINDS = %w(breakfast lunch dinner snack)
  LOCATIONS = %w(home office restaurant journey)

  validates :datetime, :description, :kind, :where, presence: true
end
