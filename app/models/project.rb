class Project < ApplicationRecord
	has_many :collaborations
	has_many :project_objectives
	has_many :collaborators, through: :collaborations, source: :collaborator
end
