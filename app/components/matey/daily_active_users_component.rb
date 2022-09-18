class Matey::DailyActiveUsersComponent < ApplicationComponent
  def initialize(visits:, time_window:)
    @visits = visits
    @time_window = time_window
    @distinct_user_visits_by_day = visits.order(:day).group(:day).uniq.count
  end
end