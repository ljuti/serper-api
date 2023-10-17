# frozen_string_literal: true

require "spec_helper"

module Serper
  module Api
    module Queries
      RSpec.describe Places do
        describe "valid object" do
          let(:query) { described_class.new(q: "neuraljets") }

          it "is a valid object" do
            expect(query).to be_a(described_class)
          end
        end

        describe "invalid object" do
          let(:no_q) { described_class.new }

          it "is not a valid object" do
            expect { no_q }.to raise_error(Dry::Struct::Error)
          end
        end

        describe "to_json" do
          let(:query) { described_class.new(q: "neuraljets") }

          it "returns a json string" do
            expect(query.to_json).to be_a(String)
            expect(JSON.parse(query.to_json)).to be_a(Hash)
          end
        end
      end
    end
  end
end
