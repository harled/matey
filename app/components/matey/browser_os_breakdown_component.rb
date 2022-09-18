class Matey::BrowserOsBreakdownComponent < ApplicationComponent
  def initialize(visits:, time_window:)
    @visits = visits
    visits_in_time_window = visits.where(started_at: time_window.ago..)
    @visits_in_time_window = visits_in_time_window.count
    @browsers = visits_in_time_window.group(:browser).count
    @oss = visits_in_time_window.group(:os).count
    @time_window = time_window
  end
end
