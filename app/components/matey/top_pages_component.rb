# frozen_string_literal: true

class Matey::TopPagesComponent < ApplicationComponent
  def initialize(events:, time_window: 1.week, limit: 5)
    raise ArgumentError unless events.is_a?(ActiveRecord::Relation)
    raise ArgumentError unless time_window.is_a?(Integer)
    raise ArgumentError unless limit.is_a?(Integer)

    @time_window = time_window

    # Scope events to time period given
    @events = events.where(time: @time_window.ago..Time.current)

    # Group events by controller (:name) and action. Aggregate number of unique user actions
    @user_count_by_event = @events.group(:name).group_prop(:action).select(:user_id).distinct.count

    # Filter for the top 10 elements by user actions
    @user_count_by_event = @user_count_by_event.sort_by { |controller_name_and_action, count| count }.last(10).reverse
  end
end
