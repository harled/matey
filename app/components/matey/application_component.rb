require "view_component"
require "ahoy_matey"
require_relative "../../../lib/helpers"

class Matey::ApplicationComponent < ViewComponent::Base
  include ActiveModel::Validations
  include ColorSchemeHelper

  def initialize(records:, time_window:)
    super
    raise ArgumentError unless records.is_a?(ActiveRecord::Relation)
    raise ArgumentError unless time_window.is_a?(Integer)
  end

  def before_render
    validate!
  end
end
