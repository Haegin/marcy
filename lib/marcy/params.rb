require "active_support/core_ext/string/inflections"

module Marcy
  class Params

    attr_reader :path_params

    def initialize(path_params, query_params)
      @path_params = path_params
      @query_params = query_params
    end

    def query_params
      Hash[@query_params.map do |param, value|
        [param.to_s.camelize(:lower), value]
      end]
    end
  end
end
