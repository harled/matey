class Matey::LeastVisitedPagesComponent < ApplicationComponent
  def initialize(events:, time_window: 1.year, limit: 10)
    @events = events.where(time: time_window.ago..Time.current).order("count(name) ASC").limit(limit).group(:name).count

    @time_window = time_window
  end
end