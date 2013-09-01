class Chronicle < ActiveRecord::Base

  STATES_OF_MIND = %w(happy angry sad worried)

  validates :date, presence: true, uniqueness: true
  validates :mood, :summary, presence: true

  scope :ordered, order("date DESC")

end
