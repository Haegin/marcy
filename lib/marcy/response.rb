require "json"

module Marcy
  class Response < SimpleDelegator
    def json
      JSON.parse(body)
    end
  end
end
