# frozen_string_literal: true

require "dry-struct"

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

        def initialize(attributes = {})
          super(rename_keys(attributes))
        end

        private

        def rename_keys(attributes)
          attributes[:reviews] = attributes.delete(:ratingCount) if attributes.key?(:ratingCount)
          attributes[:phone_number] = attributes.delete(:phoneNumber) if attributes.key?(:phoneNumber)
          attributes
        end
      end
    end
  end
end
