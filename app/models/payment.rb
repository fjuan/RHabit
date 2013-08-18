class Payment < ActiveRecord::Base

  CATEGORIES = %w(home-rent home-services home-cleaning food restaurants transportation clothing personal education travels utilities)
  METHODS = %w(cash credit debit)

  validates :amount, :datetime, :description, :method, presence: true
  validates :amount, numericality: true

  scope :by_date, ->(date) { order("datetime DESC").where("datetime > ? and datetime < ?", date.beginning_of_day, date.end_of_day) }

  def summary
    "#{datetime.strftime('%Y-%m-%d at %H:%M')} - #{amount} (#{method}) on #{description}"
  end

  def date
    datetime.to_date
  end
end
