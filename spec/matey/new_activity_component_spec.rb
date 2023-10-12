# frozen_string_literal: true

require "spec_helper"

RSpec.describe Matey::NewActivityComponent, type: :component do
  context "when ahoy events are present" do
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "renders the card element" do
      subject = render_inline(Matey::NewActivityComponent.new(events: Ahoy::Event.all))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "events are missing" do
      expect { Matey::NewActivityComponent.new }.to raise_error(ArgumentError)
    end

    it "events are invalid" do
      expect { Matey::NewActivityComponent.new(events: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::NewActivityComponent.new(events: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
