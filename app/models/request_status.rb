class RequestStatus < ApplicationRecord
	has_many :connections, foreign_key: 'status_id'
	has_many :collaborations, foreign_key: 'status_id'
end
