# frozen_string_literal: true

require "rails_helper"

RSpec.describe Matey::TopEventsComponent, type: :component do
  before(:all) do
    @users = create_list(:user, 25)
    @ahoy_visits = create_list(:ahoy_visit, 25)
    @ahoy_events = create_list(:ahoy_event, 25)
  end

  context "renders component" do
    it "with a card element" do
      subject = render_inline(Matey::TopEventsComponent.new(events: Ahoy::Event.all))

      expect(subject.css("div[class='card h-100']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "events are missing" do
      expect { Matey::TopEventsComponent.new }.to raise_error(ArgumentError)
    end

    it "events are invalid" do
      expect { Matey::TopEventsComponent.new(events: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::TopEventsComponent.new(events: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
