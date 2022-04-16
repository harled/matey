require "view_component"
require "ahoy_matey"

class ApplicationComponent < ViewComponent::Base
  include ActiveModel::Validations

  def before_render
    validate!
  end
end
