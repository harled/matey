# frozen_string_literal: true

require "spec_helper"

RSpec.describe Matey::NewUsersComponent, type: :component do
  context "renders component" do
    let(:color_scheme) { "bg-light text-dark border-dark" }
    it "with a card element" do
      subject = render_inline(Matey::NewUsersComponent.new(users: User.all))

      expect(subject.css("div[class='card #{color_scheme}']").to_html).not_to be_empty
    end
  end

  context "raises an exception when" do
    it "users are missing" do
      expect { Matey::NewUsersComponent.new }.to raise_error(ArgumentError)
    end

    it "users are invalid" do
      expect { Matey::NewUsersComponent.new(users: nil) }.to raise_error(ArgumentError)
    end

    it "time_window is invalid" do
      expect { Matey::NewUsersComponent.new(users: [], time_window: nil) }.to raise_error(ArgumentError)
    end
  end
end
