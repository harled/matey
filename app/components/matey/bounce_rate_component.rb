class Matey::BounceRateComponent < ApplicationComponent
  def initialize(visits: )
    
    # First determine the total number of user sessions to the website
    @total_number_of_user_visits = visits.count

    # Then determine the number of pages visited in a session 
    # Maybe check for all sessions that only have 1 event? I.e the user went to one page and hasn't visited any other pages (thereby not triggering any other events)

    # Then scope to sessions where only ONE-PAGE was visited

    # Get the percentage as #-One-Page-Sessions / Total-#-Of-Sessions

  end 
end