# frozen_string_literal: true

class TopVisitedPagesTableComponent < ViewComponent::Base
    def initialize(events:, time_window: 1.week)
        # Scope events to time period given
        @events = events.where(time: time_period)
    
        # Group events by controller (:name) and action. Aggregate number of unique user actions
        @user_count_by_event = @events.group(:name, "properties->>'action'").select(:user_id).distinct.count
    
        # Filter for the top 10 elements by user actions
        @user_count_by_event = @user_count_by_event.sort_by { |controller_name_and_action, count| count }.last(10).reverse
    end
  end
  