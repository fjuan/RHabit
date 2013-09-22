class Payment < ActiveRecord::Base

  CATEGORIES = %w(home-rent home-services home-cleaning food restaurant transportation clothing personal education travels utilities)
  METHODS = ['cash', 'credit', 'debit', 'transfer', 'direct debit']

  validates :amount, :datetime, :description, :method, presence: true
  validates :amount, numericality: true

  belongs_to :user

  scope :by_date, ->(date) { where("payments.datetime > ? and payments.datetime < ?", date.beginning_of_day, date.end_of_day) }
  scope :ordered, -> { order("payments.datetime DESC") }

  before_save :update_accountable_for

  def summary
    "#{datetime.strftime('%Y-%m-%d at %H:%M')} - #{amount} (#{method}) on #{description}"
  end

  def date
    datetime.to_date
  end

  def time
    datetime.strftime('%H:%M')
  end

  private

  def update_accountable_for
    self.accountable_for = self.amount
    self.accountable_for = self.amount / 2 if self.shared?
  end
end
