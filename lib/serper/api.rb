# frozen_string_literal: true

require_relative "api/version"

require "dry/types"

module Types
  include Dry.Types()

  FloatOrInteger = Types::Coercible::Float | Types::Coercible::Integer
end

require "serper/api/config"
require "serper/api/client"
require "serper/api/queries"
require "serper/api/responses"

module Serper
  module Api
    class Error < StandardError; end

    # Your code goes here...
  end
end
