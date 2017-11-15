class Goal < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :goal_tags
  has_many :tags, through: :goal_tags, source: :tag
  has_many :sub_goals
  accepts_nested_attributes_for :sub_goals
  has_many :cheers
  validates :category, presence: {message: ": Which category does your goal fall under?"}
  validates :content, presence: {message: ": Please enter your goal"}
  validates :by_when, presence: {message: ": When do you see yourself accomplishing this goal?"}
  validates :tags, presence: {message: ": Please tag your goal"}
  validate :valid_date

  def later_year?
    self.by_when.year > Date.today.year
  end

  def current_year?
  	self.by_when.year == Date.today.year
  end

  def current_month?
  	self.by_when.month == Date.today.month
  end

  def later_this_month?
  	later_date? && current_month? && current_year?
  end

  def later_date?
  	self.by_when.day > Date.today.day
  end

  def later_month?
    self.by_when.month > Date.today.month
  end

  def is_upcoming?
    later_year? || later_month? || later_this_month?
  end

  def valid_date
  	if by_when && !is_upcoming?
  		errors.add(:date, "must be a future date")
  	end
  end

  def progress
    if check_sub_goals_count
      (self.sub_goals.where(complete: true).count.to_f / self.sub_goals.count.to_f) * 100
    else
      0.01
    end
  end

  def check_sub_goals_count
    if self.sub_goals.count > 0
      true
    else
      false
    end
  end

  def cheers_count
    "#{self.cheers.count} cheers"
  end
end
