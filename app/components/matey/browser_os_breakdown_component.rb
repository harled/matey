class Matey::BrowserOsBreakdownComponent < ApplicationComponent
    def initialize(visits:, time_window:)
        @visits = visits
        # visits dont have time but started_at
        visitsInTimeWindow = visits.where(started_at: time_window.ago..)
        @visitsInTimeWindow = visitsInTimeWindow.count
        
        @browsers = visitsInTimeWindow.group(:browser).count
        @oss = visitsInTimeWindow.group(:os).count

        #TODO would be very cool if we could somehow group by mac/windows/linux and then split into browsers (or the inverse)

        # @safari = visits.where(browser: "Safari").take #take only returns one
        # @chromes = visits.where(browser: "Chrome").all
        @time_window = time_window
    end
end