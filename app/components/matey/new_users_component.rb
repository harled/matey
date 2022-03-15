require 'ahoy_matey'

class Matey::NewUsersComponent < ApplicationComponent
  def initialize(user:, time_window: 1.week)
    @current_period = user.where(created_at: time_window.ago..Time.current).count
    previous_period = user.where(created_at: (2 * time_window).ago..time_window.ago).count

    @change_active_number = @current_period - previous_period
    @change_active_percent = ((@change_active_number / (previous_period == 0 ? 1 : previous_period)) * 100).truncate(2)

    @time_window = time_window
  end
end