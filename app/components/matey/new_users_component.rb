class Matey::NewUsersComponent < Matey::ApplicationComponent
  def initialize(users:, time_window: 1.week, color_scheme: 'neutral')
    @current_period = users.where(created_at: time_window.ago..Time.current).count
    previous_period = users.where(created_at: (2 * time_window).ago..time_window.ago).count

    @change_new_number = @current_period - previous_period
    @change_new_percent = ((@change_new_number.to_f / (previous_period == 0 ? 1 : previous_period)) * 100).truncate(2)

    @time_window = time_window

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
