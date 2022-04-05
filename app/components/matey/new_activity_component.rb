class Matey::NewActivityComponent < ApplicationComponent
  def initialize(events:, time_window: 1.week)
    raise ArgumentError unless events.is_a?(ActiveRecord::Relation)
    raise ArgumentError unless time_window.is_a?(Integer)
    
    @current_period = events.where(time: time_window.ago..Time.current).count
    previous_period = events.where(time: (2 * time_window).ago..time_window.ago).pluck(:user_id).count

    @change_active_number = @current_period - previous_period
    @change_active_percent = ((@change_active_number / (previous_period == 0 ? 1 : previous_period)) * 100).truncate(2)

    @time_window = time_window
  end
end