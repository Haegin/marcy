require "faraday"
require "marcy/resource"

module Marcy
  class UserResource < Resource
    attr_reader :user

    AUTH = "Authorization"

    def initialize(user, headers: {})
      @user = user
      super(headers: headers.merge(user.authorization_headers))
    end
  end
end
