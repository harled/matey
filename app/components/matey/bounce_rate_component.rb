require "ahoy_matey"

class Matey::BounceRateComponent < ApplicationComponent
  def initialize(visits:, users:)
    
    # First determine the total number of user sessions to the website
      # visits/events have a NIL user_id associated with them
    @total_number_of_user_visits = visits.count
      # users array is EMPTY (users aren't being created?)
    @number_users = users.count

    # Then determine the number of pages visited in a session 
    # Maybe check for all visits that only have 1 event? I.e the user went to one page and hasn't visited any other pages (thereby not triggering any other events)
    

    # Then scope to sessions where only ONE-PAGE was visited

    # Get the percentage as #-One-Page-Visits / Total-#-Of-Visits

  end 
end