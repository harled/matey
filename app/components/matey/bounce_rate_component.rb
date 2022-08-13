require "ahoy_matey"

class Matey::BounceRateComponent < ApplicationComponent
  def initialize(events:)
    raise ArgumentError unless events.is_a?(ActiveRecord::Relation)

    # First determine the total number of user sessions to the website
    @total_number_of_user_visits = events.pluck(:visit_id).uniq.count

    # First we group by visit_id and scope to visits containing ONLY 1 event
    # We then count each unique occurence of an visit with 1 event
    @total_number_of_single_event_visits = events.group(:visit_id).having("count(ahoy_events.id) == 1").uniq.count
    

    # Get the percentage as #-One-Page-Visits / Total-#-Of-Visits

  end 
end