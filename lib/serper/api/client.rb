require "async"
require "async/http/faraday"
require "faraday"
require "serper/api/config"
require "serper/api/responses"

module Serper
  module Api
    class Client
      def initialize(config = Config.new, debug: false)
        @config = config
        @debug = debug
      end

      def places(query)
        response = post("/places", query)

        if response.success?
          if response.body.is_a?(Array)
            response.body.map { |payload| to_places(payload) }
          else
            to_places(response.body)
          end
        else
          raise Error, response.body
        end
      end

      def post(path, query)
        connection.post(path) do |req|
          req.body = query.to_json
          req.headers["X-API-KEY"] = config.api_key
          req.headers["Content-Type"] = "application/json"
        end
      end

      private

      attr_reader :config

      def to_places(payload)
        Responses::Places.new(
          search_parameters: Responses::SearchParameters.new(payload["searchParameters"]),
          places: payload["places"].map { |place| Responses::Place.new(transform_hash(place)) },
        )
      end

      def connection
        @connection ||= Faraday.new(url: config.api_url) do |app|
          app.request :json
          app.response :json
          app.response :logger, ::Logger.new(STDOUT), bodies: true if @debug
          app.adapter :async_http
        end
      end

      def transform_hash(place)
        place.symbolize_keys!
        place[:reviews] = place.delete(:ratingCount) if place.key?(:ratingCount)
        place[:phone_number] = place.delete(:phoneNumber) if place.key?(:phoneNumber)
        place
      end
    end
  end
end
