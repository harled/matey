# frozen_string_literal: true

class Matey::TopEventsComponent < Matey::ApplicationComponent
  def initialize(events:, time_window: 1.week, limit: 5, color_scheme: "neutral")
    raise ArgumentError unless events.is_a?(ActiveRecord::Relation)
    raise ArgumentError unless time_window.is_a?(Integer)

    @events = events.where(time: time_window.ago..Time.current).limit(limit).order("count(name) DESC").group(:name).count
    @time_window = time_window

    @color_scheme = color_scheme(scheme: color_scheme)
  end
end
