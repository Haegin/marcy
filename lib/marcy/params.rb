require "active_support/core_ext/string/inflections"

module Marcy
  class Params

    DATE_FORMAT = "%Y-%m-%d".freeze

    def initialize(path_params, query_params)
      @path_params = path_params
      @query_params = query_params
    end

    # Public: The path params, with the values cast to strings appropriately
    #
    # Returns a Hash
    def path_params
      Hash[@path_params.map { |param, value| [param, cast_to_string(value)] }]
    end

    # Public: The query params, with the values cast to strings and the
    # parameter names converted to the correct caes for HMRC.
    #
    # Returns a Hash
    def query_params
      Hash[@query_params.map do |param, value|
        [param.to_s.camelize(:lower), cast_to_string(value)]
      end]
    end

    private

    # Internal: convert the value to a string in the correct format for passing
    # as a parameter
    #
    # value - the thing to cast
    #
    # Returns a String
    def cast_to_string(value)
      case value
      when Date
        value.strftime(DATE_FORMAT)
      else
        value.to_s
      end
    end
  end
end
