# frozen_string_literal: true

require "rails_helper"

RSpec.describe Matey::TopVisitedPagesTableComponent, type: :component do
  context "renders component" do
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "with a card element" do
      subject = render_inline(Matey::TopVisitedPagesTableComponent.new(events: Ahoy::Visit.all))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "events are missing" do
      expect { Matey::TopVisitedPagesTableComponent.new }.to raise_error(ArgumentError)
    end

    it "events are invalid" do
      expect { Matey::TopVisitedPagesTableComponent.new(events: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::TopVisitedPagesTableComponent.new(events: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
