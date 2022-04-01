class HomeController < ApplicationController
  def index
    ahoy.track "My first event", language: "Ruby"
    if rand(10) > 5
      ahoy.track "My random event", language: "Ruby"
    end
  end
end
