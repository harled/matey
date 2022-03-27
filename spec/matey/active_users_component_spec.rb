require "spec_helper"

RSpec.describe Matey::ActiveUsersComponent, type: :component do
  context "renders component" do
    it "with a card element" do
      subject = render_inline(Matey::ActiveUsersComponent.new(events: Ahoy::Event.all))

      expect(subject.css("div[class='card']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "events are missing" do
      expect { Matey::ActiveUsersComponent.new }.to raise_error(ArgumentError)
    end 

    it "events are invalid" do
      expect { Matey::ActiveUsersComponent.new(events: nil) }.to raise_error(ArgumentError)
    end 

    it "time_window is invalid" do
      expect { Matey::ActiveUsersComponent.new(events: [], time_window: nil) }.to raise_error(ArgumentError)
    end 
  end
end 