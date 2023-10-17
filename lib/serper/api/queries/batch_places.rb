# frozen_string_literal: true

require "dry-struct"

require "serper/api/queries/places"

module Serper
  module Api
    module Queries
      class BatchPlaces < Dry::Struct
        attribute :places, Types::Array.of(Places)

        def to_json
          places.map(&:to_h).to_json
        end
      end
    end
  end
end
