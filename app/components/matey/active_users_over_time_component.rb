require 'ahoy_matey'
require 'apexcharts'

class Matey::ActiveUsersOverTimeComponent < ApplicationComponent
	def initialize(events:, time_window: 1.week)
		@current_period = events.where(time: time_window.ago..Time.current).pluck(:user_id).uniq.count
		previous_period = events.where(time: (2 * time_window).ago..time_window.ago).pluck(:user_id).uniq.count

		@change_active_number = @current_period - previous_period
		@change_active_percent = ((@change_active_number / (previous_period == 0 ? 1 : previous_period)) * 100).truncate(2)

		@time_window = time_window
	end
end