require "marcy/user_resource"

module Marcy
  module NationalInsurance
    class AnnualSummary < UserResource
      ENDPOINT = "/national-insurance/sa/%{utr}/annual-summary/%{tax_year}"
      PATH_PARAMS = [:utr, :tax_year]

      def endpoint
        self.class::ENDPOINT % {utr: params.path_params[:utr], tax_year: params.path_params[:tax_year]}
      end
    end
  end
end
