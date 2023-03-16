require "ahoy_matey"

class Matey::VisitsByDayOfWeekComponent < Matey::ApplicationComponent
  def initialize(visits:, time_window: 1.month, limit: 10, exclude_days: [], color_scheme: 'neutral')
    @time_window = time_window

    # query for all the visits
    all_visits = visits.where(started_at: time_window.ago..)

    visits_by_day_of_week = {}

    # get day of week from each visit. Incrase value of dayOfWeek key by 1 if key is already there else initialize key with value of 1
    all_visits.each { |visit| visits_by_day_of_week.key?(visit.started_at.strftime("%A")) ? visits_by_day_of_week[(visit.started_at.strftime("%A"))] += 1 : visits_by_day_of_week[visit.started_at.strftime("%A")] = 1 }

    # take out items from visits_by_day_of_week  hashmap based on exclude_days parameter
    if exclude_days.length > 0
      exclude_days.each { |exclude| visits_by_day_of_week = visits_by_day_of_week.slice!(exclude) }
    end

    @visits_by_day_of_week = visits_by_day_of_week

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
