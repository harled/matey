require "ahoy_matey"

class Matey::UserEngagementComponent < ApplicationComponent
  def initialize(events:, user_id:, time_window: 1.week, limit: 10)
    @events_for_user = events.where(time: time_window.ago..Time.current).where_props(user_id: user_id).group(:name).count
    @count_by_event = @events_for_user.sort_by { |event, count| count }.last(limit).reverse
    @time_window = time_window
    @user_id = user_id
  end
end
