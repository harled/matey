require "ahoy_matey"

class Matey::UserEngagementComponent < Matey::ApplicationComponent
  def initialize(events:, user_id:, time_window: 1.week, limit: 10, color_scheme: "neutral")
    super(records: events, time_window: time_window)

    @events_for_user = events.where_props(user_id: user_id).where(time: time_window.ago..Time.current).group(:name).count
    @count_by_event = @events_for_user.sort_by { |event, count| count }.last(limit).reverse
    @time_window = time_window
    @user_id = user_id

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
