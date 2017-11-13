class Vision < ApplicationRecord
	belongs_to :user

	def most_recent_time_frame_in_years_from_now
		self.timeframe.year - Date.today.year
	end

	def set_timeframe(years)
		self.timeframe = Date.new(years.to_i + Date.today.year, Date.today.month, Date.today.day)
	end
end
