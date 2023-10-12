class Matey::NewActivityComponent < Matey::ApplicationComponent
  def initialize(events:, time_window: 1.week, color_scheme: "neutral")
    validate_arguments(events, time_window)

    @current_period = events.where(time: time_window.ago..Time.current).count
    previous_period = events.where(time: (2 * time_window).ago..time_window.ago).pluck(:user_id).count

    @change_active_number = @current_period - previous_period
    @change_active_percent = ((@change_active_number.to_f / ((previous_period == 0) ? 1 : previous_period)) * 100).truncate(2)

    @time_window = time_window

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
