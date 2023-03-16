require "view_component"
require "ahoy_matey"
require_relative "../../../lib/helpers"

class Matey::ApplicationComponent < ViewComponent::Base
  include ActiveModel::Validations
  include ColorSchemeHelper

  def before_render
    validate!
  end
end
