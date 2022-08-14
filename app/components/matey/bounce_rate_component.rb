require "ahoy_matey"

class Matey::BounceRateComponent < ApplicationComponent
  def initialize(events:, visits:, limit: 5)

    # Determine the total number of user sessions to the website
    @total_number_of_user_visits = events.pluck(:visit_id).uniq.count

    # First we group by visit_id and scope to visits containing ONLY 1 event
    @visits_having_only_one_event = events.group(:visit_id).having("count(ahoy_events.id) == 1")
    # We then count each unique occurence of a visit with 1 event
    @total_number_of_single_event_visits = @visits_having_only_one_event.uniq.count

    # Determine pages in which the most bounces occur
    @single_event_visits_landing_page_count = visits.where(id: @visits_having_only_one_event.pluck(:visit_id)).pluck(:landing_page).tally

    # Scope the results to the given limit and sort them in descending order
    @most_bounced_pages = @single_event_visits_landing_page_count.sort_by { |controller_name_and_action, count| count }.last(limit).reverse

    # Get the percentage as #-One-Page-Visits / Total-#-Of-Visits
    @percentage_of_visits_that_were_bounced = ((@total_number_of_single_event_visits.to_f / (@total_number_of_user_visits == 0 ? 1 : @total_number_of_user_visits)) * 100).truncate(1)
  end
end
