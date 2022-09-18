require "ahoy_matey"

class Matey::VisitsByDayOfWeekComponent < ApplicationComponent
  def initialize(visits:, time_window: 1.month, limit: 10, exclude_days: [])
    
    @time_window = time_window

    # query for all the visits
    allVisits = visits.where(started_at: time_window.ago..)

    visitsByDayOfWeek = Hash.new 
    # get day of week from each visit. Incrase value of dayOfWeek key by 1 if key is already there else initialize key with value of 1 
    allVisits.each{ |visit| visitsByDayOfWeek.key?(visit.started_at.strftime("%A")) ? visitsByDayOfWeek[(visit.started_at.strftime("%A"))] += 1: visitsByDayOfWeek[(visit.started_at.strftime("%A"))] = 1 }
    
    # take out items from visitsByDayOfWeek  hashmap based on exclude_days parameter
    if exclude_days.length > 0   
      exclude_days.each{ |exclude| visitsByDayOfWeek = visitsByDayOfWeek.slice!(exclude) }
    end 

    @visitsByDayOfWeek = visitsByDayOfWeek
    

  end
end 