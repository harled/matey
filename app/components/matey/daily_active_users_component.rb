class Matey::DailyActiveUsersComponent < Matey::ApplicationComponent
  def initialize(visits:, time_window:)
    @visits = visits
    @time_window = time_window
    visits_in_time_window = visits.where(started_at: time_window.ago..)
    @distinct_user_visits_by_day = visits_in_time_window.order(:day).group(:day).uniq.count
    @distinct_user_visits_by_day2 = visits_in_time_window.order(:day).group("DATE(started_at)").map { |k, v| [k, v] }.sort
  end
end
