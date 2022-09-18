# frozen_string_literal: true

require_relative "matey/version"

require_relative "../app/components/application_component"
require_relative "../app/components/matey/active_users_component"
require_relative "../app/components/matey/bounce_rate_component"
require_relative "../app/components/matey/new_activity_component"
require_relative "../app/components/matey/new_users_component"
require_relative "../app/components/matey/top_events_component"
require_relative "../app/components/matey/top_visited_pages_table_component"
require_relative "../app/components/matey/user_engagement_component"
require_relative "../app/components/matey/visits_by_day_of_week_component"

module Matey
  class Error < StandardError; end
  # Your code goes here...
end
