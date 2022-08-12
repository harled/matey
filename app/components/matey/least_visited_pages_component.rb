class Matey::LeastVisitedPagesComponent < ApplicationComponent
  def initialize(events:, time_window: 1.year, limit: 10)
    @events = events.where(time: time_window.ago..Time.current).group("properties -> 'controller'", "properties -> 'action'").count.sort_by { |k, v| v}.first(limit)
    # for example:
    # @events = events.where(time: time_window.ago..Time.current).group("properties -> 'controller'", "properties -> 'action'").count.sort_by { |k, v| v}.first(limit)

    @time_window = time_window

    # grouped = events.where(time: 1.year.ago..Time.current).pluck(:properties)
    # new_arr = grouped.group_by { |i| i}
    # events = {}
    # new_arr.keys.each do |i|
    #   events[i] = new_arr[i].count
    # end
    # @events = events.sort_by { |k, v| v}
  end
end