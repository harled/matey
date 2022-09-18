class Matey::BrowserOsBreakdownComponent < ApplicationComponent
    def initialize(visits:, time_window:)
        @visits = visits
        
        @browsers = visits.group(:browser).count
        @oss = visits.group(:os).count

        @view_count = visits.length()

        #would be very cool if we could somehow group by mac/windows/linux and then split into browsers (or the inverse)

        @safari = visits.where(browser: "Safari").take #take only returns one
        @chromes = visits.where(browser: "Chrome").all
        @time_window = time_window
    end
end