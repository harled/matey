class Matey::BrowserOsBreakdownComponent < Matey::ApplicationComponent
  def initialize(visits:, time_window:, color_scheme: 'neutral')
    visits_in_time_window = visits.where(started_at: time_window.ago..)
    @visits_in_time_window = visits_in_time_window.count
    @browsers = visits_in_time_window.group(:browser).count
    @operating_systems = visits_in_time_window.group(:os).count
    @time_window = time_window

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
