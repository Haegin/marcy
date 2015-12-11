require "marcy/user_resource"

module Marcy
  module Hello
    class User < UserResource
      ENDPOINT = "/hello/user"
    end
  end
end
