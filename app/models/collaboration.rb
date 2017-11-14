class Collaboration < ApplicationRecord
  belongs_to :request, class_name: :CollaborationRequest
	belongs_to :collaborator, class_name: :User
	belongs_to :project
end
