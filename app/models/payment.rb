class Payment < ActiveRecord::Base

  CATEGORIES = %w(home-rent home-services home-cleaning food restaurant transportation clothing personal education travels utilities)
  METHODS = %w(cash credit debit transfer)

  validates :amount, :datetime, :description, :method, presence: true
  validates :amount, numericality: true

  belongs_to :user

  scope :by_date, ->(date) { where("payments.datetime > ? and payments.datetime < ?", date.beginning_of_day, date.end_of_day) }
  scope :ordered, -> { order("payments.datetime DESC") }

  def summary
    "#{datetime.strftime('%Y-%m-%d at %H:%M')} - #{amount} (#{method}) on #{description}"
  end

  def date
    datetime.to_date
  end

  def time
    datetime.strftime('%H:%M')
  end
end
