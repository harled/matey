class HomeController < ApplicationController
  def index
    ahoy.track "My first event", language: "Ruby"
  end
end
