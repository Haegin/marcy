require "faraday"
require "marcy/response"

module Marcy
  class Resource
    HMRC_API_BASE_URL = "https://api.service.hmrc.gov.uk"
    DEFAULT_HEADERS = {
      "Accept" => "application/vnd.hmrc.1.0+json"
    }

    attr_reader :endpoint, :headers, :params

    def initialize(headers: {})
      @endpoint = self.class::ENDPOINT
      @headers = headers.merge(DEFAULT_HEADERS)
    end

    def get(params = {})
      @params = params
      response = connection.get(endpoint) do |req|
        req.headers = headers
      end
      Marcy::Response.new(response)
    end

    def connection
      @@connection ||= Faraday.new(url: HMRC_API_BASE_URL)
    end
  end
end
