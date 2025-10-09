# frozen_string_literal: true

require "spec_helper"

RSpec.describe Matey::BrowserOsBreakdownComponent, type: :component do
  context "renders component" do
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "with a card element" do
      subject = render_inline(Matey::BrowserOsBreakdownComponent.new(visits: Ahoy::Visit.all, time_window: 1.week))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "visits are missing" do
      expect { Matey::BrowserOsBreakdownComponent.new }.to raise_error(ArgumentError)
    end

    it "visits are invalid" do
      expect { Matey::BrowserOsBreakdownComponent.new(visits: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::BrowserOsBreakdownComponent.new(visits: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
