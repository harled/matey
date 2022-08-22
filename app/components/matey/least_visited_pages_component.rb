class Matey::LeastVisitedPagesComponent < ApplicationComponent
  def initialize(events:, filter_property: nil, filter_value: nil, time_window: 1.year, limit: 10)
    @events = if filter_property && filter_value
      events.where_props("#{filter_property}": filter_value).where(time: time_window.ago..Time.current).group(:properties).count.sort_by { |k, v| v }.first(limit)
    else
      events.where(time: time_window.ago..Time.current).group(:properties).count.sort_by { |k, v| v }.first(limit)
    end

    @time_window = time_window
    @filter_property = filter_property
  end
end
