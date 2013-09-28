class Milestone < ActiveRecord::Base
  belongs_to :challenge

  scope :by_date,    ->(date) { where(date: date) }
  scope :until_date, ->(date) { where("date <= ?", date) }
  scope :ordered,    -> { order("date DESC") }

  def mark_completed
    self.update_attribute(:completed, true)
  end

  def start_time
    date.beginning_of_day
  end

  def completed_badge
    return 'success' if completed?
    return 'warning' if date <= Date.today
    return ''
  end

  def old?
    date <= Date.today
  end
end
