# frozen_string_literal: true

module Serper
  module Api
    module Responses
      class SearchParameters < Dry::Struct
        transform_keys(&:to_sym)

        attribute? :q, Types::String
        attribute? :gl, Types::String
        attribute? :hl, Types::String.default("en")
        attribute? :num, Types::Integer
        attribute? :autocorrect, Types::Bool.default(true)
        attribute? :page, Types::Integer.default(1)
        attribute? :type, Types::String
        attribute? :engine, Types::String.default("google")
      end
    end
  end
end
