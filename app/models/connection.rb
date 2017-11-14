class Connection < ApplicationRecord
	belongs_to :champ, class_name: :User
  belongs_to :squad_member, class_name: :User
  belongs_to :status, class_name: :RequestStatus
end
