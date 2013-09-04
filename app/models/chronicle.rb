class Chronicle < ActiveRecord::Base

  STATES_OF_MIND = %w(happy angry sad worried)

  validates :date, presence: true, uniqueness: {scope: :user_id}
  validates :mood, :summary, presence: true

  belongs_to :user

  scope :ordered, -> { order("chronicles.date DESC") }

end
