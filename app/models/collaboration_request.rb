class CollaborationRequest < ApplicationRecord
	belongs_to :request_sender, class_name: :User
	belongs_to :request_receiver, class_name: :User
  belongs_to :status, class_name: :RequestStatus
  has_many :collaborations, foreign_key: :request_id
end
