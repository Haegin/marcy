require "marcy/request"

module Marcy
  module Hello
    class World < Request
      ENDPOINT = "/hello/world"
    end
  end
end
