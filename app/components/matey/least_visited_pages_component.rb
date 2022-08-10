class Matey::LeastVisitedPagesComponent < ApplicationComponent
  def initialize(events:, limit: 10)
    @events = events
  end
end