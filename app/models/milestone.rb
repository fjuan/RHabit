class Milestone < ActiveRecord::Base
  belongs_to :challenge

  scope :by_date,    ->(date) { where(date: date) }
  scope :until_date, ->(date) { where("date <= ?", date) }
  scope :ordered,    -> { order("date DESC") }

  def completed_string
    completed? ? 'yes' : 'no'
  end

  def mark_completed
    self.update_attribute(:completed, true)
  end
end
