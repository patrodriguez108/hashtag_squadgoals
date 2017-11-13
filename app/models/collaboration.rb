class Collaboration < ApplicationRecord
	belongs_to :collaborator, class_name: :User
  belongs_to :status, class_name: :RequestStatus
	belongs_to :project
end
