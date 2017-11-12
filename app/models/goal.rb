class Goal < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :goal_tags
  has_many :tags, through: :goal_tags, source: :tag
  has_many :sub_goals
end
