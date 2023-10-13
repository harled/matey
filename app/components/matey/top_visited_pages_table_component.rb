class Matey::TopVisitedPagesTableComponent < Matey::ApplicationComponent
  def initialize(events:, time_window: 1.week, limit: 10, color_scheme: "neutral")
    super(records: events, time_window: time_window)

    # Group events by controller (:name) and action. Aggregate number of unique user actions
    @user_count_by_event = events.where(started_at: time_window.ago..).pluck(:landing_page).tally

    # Filter for the top 10 elements by user actions
    @user_count_by_event = @user_count_by_event.sort_by { |controller_name_and_action, count| count }.last(limit).reverse

    @time_window = time_window

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
