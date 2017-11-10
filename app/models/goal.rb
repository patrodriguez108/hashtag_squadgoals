class Goal < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :goal_tags
end
