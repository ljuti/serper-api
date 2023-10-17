# frozen_string_literal: true

require "dry-struct"
require "active_support/core_ext/hash/indifferent_access"

module Serper
  module Api
    module Responses
      class Place < Dry::Struct
        transform_keys(&:to_sym)

        attribute? :position, Types::Integer
        attribute? :title, Types::String
        attribute? :address, Types::String
        attribute? :latitude, Types::Float
        attribute? :longitude, Types::Float
        attribute? :rating, Types::FloatOrInteger
        attribute? :reviews, Types::Integer
        attribute? :category, Types::String
        attribute? :phone_number, Types::String
        attribute? :website, Types::String
        attribute? :cid, Types::String
      end
    end
  end
end
