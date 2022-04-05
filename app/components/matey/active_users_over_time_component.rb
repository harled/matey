require 'ahoy_matey'
require 'gruff'

class Matey::ActiveUsersOverTimeComponent < ApplicationComponent
	def initialize(events:, time_window: 1.week)
		@current_period = events.where(time: time_window.ago..Time.current).pluck(:user_id).uniq.count
		previous_period = events.where(time: (2 * time_window).ago..time_window.ago).pluck(:user_id).uniq.count

		@change_active_number = @current_period - previous_period
		@change_active_percent = ((@change_active_number / (previous_period == 0 ? 1 : previous_period)) * 100).truncate(2)

		@time_window = time_window

		g = Gruff::Line.new

		g.title = "Active Users Since $(time_window.ago)"
		g.labels = { 0 => '5/6', 1 => '5/15', 2 => '5/24', 3 => '5/30', 4 => '6/4',
					5 => '6/12', 6 => '6/21', 7 => '6/28' }
		g.data :Jimmy, [25, 36, 86, 39, 25, 31, 79, 88]
		g.data :Charles, [80, 54, 67, 54, 68, 70, 90, 95]
		g.data :Julie, [22, 29, 35, 38, 36, 40, 46, 57]
		g.data :Jane, [95, 95, 95, 90, 85, 80, 88, 100]
		g.data :Philip, [90, 34, 23, 12, 78, 89, 98, 88]
		g.data :Arthur, [5, 10, 13, 11, 6, 16, 22, 32]
		@graph = g.write('exciting.png')
	end
end