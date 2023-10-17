# frozen_string_literal: true

require "spec_helper"

Anyway::Settings.use_local_files = true

module Serper
  module Api
    RSpec.describe Client do
      describe "initialization" do
        it "initializes with a config" do
          expect(described_class.new(config: Config.new)).to be_a(described_class)
        end
      end

      describe "API calls" do
        describe "places" do
          context "with a single places query" do
            let(:client) { described_class.new }
            let(:query) { Queries::Places.new(q: "apple inc") }

            it "returns a response" do
              VCR.use_cassette("client/places") do
                expect(client.places(query)).to be_a(Responses::Places)
              end
            end
          end

          context "with a batch places query" do
            let(:client) { described_class.new }
            let(:query) { Queries::BatchPlaces.new(places: [Queries::Places.new(q: "apple inc"), Queries::Places.new(q: "tesla inc")]) }

            it "returns a response" do
              VCR.use_cassette("client/batch_places") do
                expect(client.places(query)).to all(be_a(Responses::Places))
              end
            end
          end
        end
      end
    end
  end
end
