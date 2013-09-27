class Workout < ActiveRecord::Base

  SPORTS = %w(running pilates swimming tennis padel cycling)

  validates :datetime, :duration, :sport, presence: true

  belongs_to :user

  scope :by_date, ->(date) { where("workouts.datetime > ? and workouts.datetime < ?", date.beginning_of_day, date.end_of_day) }
  scope :ordered, -> { order("workouts.datetime DESC") }

  def date
    datetime.to_date
  end

  def time
    datetime.strftime('%H:%M')
  end
end
