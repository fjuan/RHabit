class Chronicle < ActiveRecord::Base

  STATES_OF_MIND = %w(happy angry sad worried)

  validates :date, :mood, :summary, presence: true
end
