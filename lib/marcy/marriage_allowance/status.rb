require "marcy/user_resource"

module Marcy
  module MarriageAllowance
    class Status < UserResource
      ENDPOINT = "/marriage-allowance/sa/%{utr}/status"
      PATH_PARAMS = [:utr]
      QUERY_PARAMS = [:tax_year]

      def endpoint
        self.class::ENDPOINT % {utr: params.path_params[:utr]}
      end
    end
  end
end
