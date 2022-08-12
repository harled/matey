class HomeController < ApplicationController
  def index
    ahoy.track "My first event", language: "Ruby"
    if rand(10) > 5
      ahoy.track "My random event", language: "Ruby", action: "show"
    end
    if rand(25) > 12.5
      ahoy.track "Another event", controller: "home"
    end
  end
end
