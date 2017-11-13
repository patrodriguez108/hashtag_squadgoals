class Goal < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :goal_tags
  has_many :tags, through: :goal_tags, source: :tag
  has_many :sub_goals

  validates :category, presence: {message: ": Which category does your goal fall under?"}
  validates :content, presence: {message: ": Please enter your goal"}
  validates :by_when, presence: {message: ": When do you see yourself accomplishing this goal?"}
  validates :tags, presence: {message: ": Please tag your goal"}
end
