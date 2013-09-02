class Meal < ActiveRecord::Base

  KINDS = %w(breakfast lunch dinner snack)
  LOCATIONS = %w(home office restaurant journey)

  validates :datetime, :description, :kind, :where, presence: true

  belongs_to :user

  scope :by_date, ->(date) { where("meals.datetime > ? and meals.datetime < ?", date.beginning_of_day, date.end_of_day) }
  scope :ordered, -> { order("meals.datetime DESC") }

  def summary
    "#{datetime.strftime('%Y-%m-%d at %H:%M')} - #{kind} at #{where}: #{description}"
  end

  def date
    datetime.to_date
  end

  def time
    datetime.strftime('%H:%M')
  end
end
