class Matey::LeastVisitedPagesComponent < ApplicationComponent

  def initialize(events:, filter_property: nil, filter_value: nil, time_window: 1.year, limit: 10)
    @verified_props = verify_props(filter_property, filter_value, events)
    @filter_value = filter_value if filter_value
    @filter_property = filter_property if filter_property
    @time_window = time_window

    # verify that both prop and val have been passed in and that they are valid
    @events = if filter_property && filter_value && verify_props(filter_property, filter_value, events)
      events.where_props("#{filter_property}": filter_value).where(time: time_window.ago..Time.current).group(:properties).count.sort_by { |k, v| v }.first(limit)
    else
      events.where(time: time_window.ago..Time.current).group(:properties).count.sort_by { |k, v| v }.first(limit)
    end
  end

  def verify_props(prop, val, events)
      hash = {}
      props = events.group(:properties).count

      props.keys.each do |key|
        key.each do |each_key|
          hash[each_key] = 1
        end
      end
      hash.key? [prop, val]
    end
end
