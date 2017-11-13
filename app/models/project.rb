class Project < ApplicationRecord
	has_many :collaborations
	has_many :project_goals
end
