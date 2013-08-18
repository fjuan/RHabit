class Meal < ActiveRecord::Base

  KINDS = %w(breakfast lunch dinner snack)
  LOCATIONS = %w(home office restaurant journey)

  validates :datetime, :description, :kind, :where, presence: true

  scope :by_date, ->(date) { order("datetime DESC").where("datetime > ? and datetime < ?", date.beginning_of_day, date.end_of_day) }

  def summary
    "#{datetime.strftime('%Y-%m-%d at %H:%M')} - #{kind} at #{where}: #{description}"
  end
end
