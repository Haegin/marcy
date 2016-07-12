require "marcy/user_resource"

module Marcy
  module MarriageAllowance
    class Eligibility < UserResource
      ENDPOINT = "/marriage-allowance/sa/%{utr}/eligibility"
      PATH_PARAMS = [:utr]
      QUERY_PARAMS = [:nino, :firstname, :surname, :date_of_birth, :tax_year]

      def endpoint
        self.class::ENDPOINT % {utr: params.path_params[:utr]}
      end
    end
  end
end
