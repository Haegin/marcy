require "marcy/user_resource"

module Marcy
  module NationalInsurance
    class AnnualSummary < UserResource
      ENDPOINT = "/national-insurance/sa/%{utr}/annual-summary/%{tax_year}"

      def endpoint
        self.class::ENDPOINT % {utr: params[:utr], tax_year: params[:tax_year]}
      end
    end
  end
end
