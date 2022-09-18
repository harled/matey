class Matey::BrowserOsBreakdownComponent < ApplicationComponent
    def initialize(visits:, time_window:)
        @visits = visits
        
        #creating a hash to find all the different browsers
        #incrementing the hashes 
        browsers = Hash.new
        visits.each{ |visit| browsers.key?(visit.browser) ? browsers[visit.browser] += 1 : browsers[visit.browser] = 1 }
        @browsers = browsers

        oss = Hash.new
        visits.each{ |visit| oss.key?(visit.os) ? oss[visit.os] += 1 : oss[visit.os] = 1 }
        @oss = oss

        @view_count = visits.length()

        #could probably just query the database

        @safari = visits.where(browser: "Safari").take #take only returns one
        @chromes = visits.where(browser: "Chrome").all
        @time_window = time_window
    end
end