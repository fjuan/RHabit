class Payment < ActiveRecord::Base

  CATEGORIES = %w(home-rent home-services home-cleaning food restaurants transportation clothing personal education travels utilities)
  METHODS = %w(cash credit debit)

  validates :amount, :datetime, :description, :method, presence: true
  validates :amount, numericality: true

end
