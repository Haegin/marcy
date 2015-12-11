module Marcy
  class User
    attr_reader :access_token, :refresh_token

    def initialize(access_token:, refresh_token: nil)
      @access_token = access_token
      @refresh_token = refresh_token
    end

    def authorization_headers
      {
        "Authorization" => "Bearer #{access_token}"
      }
    end
  end
end
