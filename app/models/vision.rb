class Vision < ApplicationRecord
	belongs_to :user

	def most_recent_time_frame_in_years_from_now
		self.timeframe.year - Date.today.year
	end
end
