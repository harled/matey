# frozen_string_literal: true

require "spec_helper"

RSpec.describe Matey::UserEngagementComponent, type: :component do
  context "when ahoy events are present" do
    let(:user) { create(:user) }
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "renders the card element" do
      subject = render_inline(Matey::UserEngagementComponent.new(events: Ahoy::Event.all, user_id: user.id))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "events are missing" do
      expect { Matey::UserEngagementComponent.new }.to raise_error(ArgumentError)
    end

    it "events are invalid" do
      expect { Matey::UserEngagementComponent.new(events: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::UserEngagementComponent.new(events: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
