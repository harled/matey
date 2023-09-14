require "ahoy_matey"
require "groupdate"

class Matey::VisitsByDayOfWeekComponent < Matey::ApplicationComponent
  def initialize(visits:, time_window: 1.month, exclude_days: [], color_scheme: "neutral")
    @visits = visits
    @time_window = time_window
    @exclude_days = exclude_days
    @color_scheme = color_scheme(scheme: color_scheme)
  end

  # group visits by day in provided time window
  def visits_by_day_of_week
    visits_by_day_of_week = @visits.group_by_day_of_week(:started_at, format: "%A", range: @time_window.ago..).count
    visits_by_day_of_week.except!(*@exclude_days) if @exclude_days.any?
  end
end
