require "faraday"
require "marcy/response"
require "marcy/params"

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
      @params = Marcy::Params.new(
        *params.partition { |p, _| self.class::PATH_PARAMS.include? p }.map { |params| Hash[params] }
      )
      response = connection.get(endpoint) do |req|
        req.headers = headers
        req.params = @params.query_params
      end
      Marcy::Response.new(response)
    end

    def connection
      @@connection ||= Faraday.new(url: HMRC_API_BASE_URL)
    end
  end
end
