class ActionCards::ActiveUsersComponent < ViewComponent::Base
    def initialize(time_ago: 1.week)
      @current_active = Ahoy::Event.where(time: time_ago.ago..Time.current).pluck(:user_id).uniq.count
      previous_number = Ahoy::Event.where(time: (2 * time_ago).ago..time_ago.ago).pluck(:user_id).uniq.count
      @change_active_number = @current_active - previous_number
      @change_active_percent = ((@change_active_number / (previous_number == 0 ? 1 : previous_number)) * 100).truncate(2)
      @time_ago = time_ago
    end
  end