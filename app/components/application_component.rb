require "view_component"

class ApplicationComponent < ViewComponent::Base
  include ActiveModel::Validations

  def before_render
    validate!
  end
end
