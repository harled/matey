class Matey::DailyActiveUsersComponent < ApplicationComponent
  def initialize(visits:, time_window:)
    @visits = visits
    @time_window = time_window
    @distinct_user_visits_by_day = visits.order(:day).group(:day).uniq.count
    @distinct_user_visits_by_day2 = visits.order(:day).group('DATE(started_at)').map {|k,v| [k, v]}.sort
  end
end