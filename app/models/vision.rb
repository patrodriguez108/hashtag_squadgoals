class Vision < ApplicationRecord
	belongs_to :user

	validates :statement, presence: {message: ": Please enter your vision"}
	validate :valid_date

	def most_recent_time_frame_in_years_from_now
		self.timeframe.year - Date.today.year
	end

	def set_timeframe(years)
		self.timeframe = Date.new(years.to_i + Date.today.year, Date.today.month, Date.today.day)
	end

  def later_year?
    self.timeframe.year > Date.today.year
  end

  def valid_date
  	if timeframe && !later_year?
  		errors.add(:date, "must be a future date")
  	end
  end
end
