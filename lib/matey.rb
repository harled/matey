# frozen_string_literal: true

require_relative "matey/version"

require_relative "../app/components/application_component"
require_relative "../app/components/matey/active_users_component"
require_relative "../app/components/matey/new_users_component"
require_relative "../app/components/matey/top_events_component"

module Matey
  class Error < StandardError; end
  # Your code goes here...
end
