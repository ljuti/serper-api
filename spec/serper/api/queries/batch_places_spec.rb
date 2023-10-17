# frozen_string_literal: true

module Serper
  module Api
    module Queries
      RSpec.describe BatchPlaces do
        describe "valid object" do
          let(:query) { described_class.new(places: [Places.new(q: "neuraljets"), Places.new(q: "reforge")]) }

          it "is a valid object" do
            expect(query).to be_a(described_class)
          end

          it "can be rendered as JSON" do
            expect(query.to_json).to be_a(String)
            expect(JSON.parse(query.to_json)).to be_a(Array)
          end
        end
      end
    end
  end
end
