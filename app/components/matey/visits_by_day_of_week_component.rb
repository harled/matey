require "ahoy_matey"

class Matey::VisitsByDayOfWeekComponent < Matey::ApplicationComponent
  def initialize(visits:, time_window: 1.month, exclude_days: [], color_scheme: "neutral")
    @time_window = time_window

    visits_by_day_of_week = visits
      .where(started_at: time_window.ago..)
      .group("strftime('%w', started_at)")
      .count

    # Map numerical days back to day names
    days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    visits_by_day_of_week = visits_by_day_of_week.transform_keys { |k| days[k.to_i] }

    # Remove days to be excluded
    exclude_days.each do |day|
      visits_by_day_of_week.delete(day.capitalize)
    end

    @visits_by_day_of_week = visits_by_day_of_week
    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
