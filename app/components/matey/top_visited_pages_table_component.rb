class Matey::TopVisitedPagesTableComponent < ApplicationComponent
    def initialize(events:, time_window: 1.week, limit: 10)    
         # Group events by controller (:name) and action. Aggregate number of unique user actions
        @user_count_by_event = events.where(started_at: time_window.ago..).pluck(:landing_page).tally
            
        # Filter for the top 10 elements by user actions
        @user_count_by_event = @user_count_by_event.sort_by { |controller_name_and_action, count| count }.last(limit).reverse
        
        @time_window = time_window
    end
  end
  