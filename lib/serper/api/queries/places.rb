# frozen_string_literal: true

require "dry-struct"

module Serper
  module Api
    module Queries
      class Places < Dry::Struct
        attribute :q, Types::String
        attribute :gl, Types::String.default("us")
        attribute :hl, Types::String.default("en")
        attribute :page, Types::Integer.default(1)
        attribute :autocorrect, Types::Bool.default(true)

        def to_json
          to_h.compact.to_json
        end
      end
    end
  end
end
