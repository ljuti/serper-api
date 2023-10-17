# frozen_string_literal: true

require "dry-struct"
require "serper/api/responses/place"
require "serper/api/responses/search_parameters"

module Serper
  module Api
    module Responses
      class Places < Dry::Struct
        attribute :search_parameters, SearchParameters
        attribute :places, Types::Array.of(Place)
      end
    end
  end
end
