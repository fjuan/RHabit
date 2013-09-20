class Challenge < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true

  has_many :milestones, dependent: :destroy, order: "milestones.date ASC"
  belongs_to :user

  scope :ordered, -> { order("challenges.start_date DESC, challenges.end_date DESC") }

  after_save :save_milestones

  def weekdays
    result = []
    result << 0 if sunday?
    result << 1 if monday?
    result << 2 if tuesday?
    result << 3 if wednesday?
    result << 4 if thursday?
    result << 5 if friday?
    result << 6 if saturday?
    return result
  end

  private

  def save_milestones
    (start_date..end_date).each do |date|
      if weekdays.include? date.wday
        milestones.find_or_create_by(date: date)
      else
        milestones.find_by(date: date).try(:delete)
      end
    end
  end 
end
