# frozen_string_literal: true

require "spec_helper"

RSpec.describe Matey::VisitsByDayOfWeekComponent, type: :component do
  context "when ahoy visits are present" do
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "renders the card element" do
      subject = render_inline(Matey::VisitsByDayOfWeekComponent.new(visits: Ahoy::Visit.all, exclude_days: ["Monday", "Tuesday"]))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "visits are missing" do
      expect { Matey::VisitsByDayOfWeekComponent.new }.to raise_error(ArgumentError)
    end

    it "visits are invalid" do
      expect { Matey::VisitsByDayOfWeekComponent.new(visits: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::VisitsByDayOfWeekComponent.new(visits: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
