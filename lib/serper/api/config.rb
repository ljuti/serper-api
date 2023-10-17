require "anyway_config"

module Serper
  module Api
    BASE_URL = "https://google.serper.dev"

    class Config < Anyway::Config
      config_name :serper_api
      attr_config :api_key
      attr_config api_url: BASE_URL
      attr_config rate_limit: 50

      required :api_key
    end
  end
end
