class Matey::DailyActiveUsersComponent < ApplicationComponent
  def initialize(visits:, time_window:)
    @visits = visits
    @time_window = time_window
  end
end