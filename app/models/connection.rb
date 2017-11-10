class Connection < ApplicationRecord
	belongs_to :squad_member
	belongs_to :champ
  belongs_to :status
end
