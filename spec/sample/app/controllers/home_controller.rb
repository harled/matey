# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ahoy.track 'My first event', language: 'Ruby', user_id: 1
    ahoy.track 'My random event', language: 'Ruby' if rand(10) > 5
    ahoy.track 'Other Event', user_id: 1 if rand(100) > 50
  end
end
