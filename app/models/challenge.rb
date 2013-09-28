class Challenge < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true
  validate :check_dates

  has_many :milestones, -> { order "milestones.date ASC" }, dependent: :destroy
  belongs_to :user

  scope :ordered, -> { order("challenges.start_date DESC, challenges.end_date DESC") }
  scope :by_date, ->(date) { where("challenges.start_date <= ? and challenges.end_date >= ?", date, date)}

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

  def remaining_days(date)
    (end_date - date).to_i
  end

  def completeness_by_date(date)
    past_milestones = milestones.until_date(date)
    past_milestones_count = past_milestones.count
    completed_milestones_count = past_milestones.where(completed: true).count

    return 0 if past_milestones_count == 0
    
    return completed_milestones_count.to_f / past_milestones_count * 100
  end

  def current_streak(date)
    last_streak = streaks_on_date(date).last
    return 0 if last_streak[0] == false
    return last_streak[1]
  end

  def longest_streak(date)
    streaks_on_date(date).select{|s| s[0]}.collect{|s| s[1]}.max
  end

  def streaks_on_date(date)
    milestones.until_date(date).chunk{|m| m.completed}.collect{|s| [s[0],s[1].count]}
  end

  def week_days
    r = []
    [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].each do |dayname|
      r << Challenge.human_attribute_name(dayname) if self.send(dayname)
    end
    return r.to_sentence
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

  def check_dates
    if start_date > end_date
      errors.add(:end_date, I18n.t('errors.messages.start_date_cannot_be_greater_than_end_date'))
    end
  end
end
