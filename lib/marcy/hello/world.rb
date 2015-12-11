require "marcy/resource"

module Marcy
  module Hello
    class World < Resource
      ENDPOINT = "/hello/world"
    end
  end
end
