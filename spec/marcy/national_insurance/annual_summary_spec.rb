require "spec_helper"
require "marcy/user"
require "marcy/national_insurance/annual_summary"

describe Marcy::NationalInsurance::AnnualSummary do
  let(:url) { "https://api.service.hmrc.gov.uk/national-insurance/sa/2234567890/annual-summary/2014-15" }
  let(:user) { Marcy::User.new(access_token: "faketoken") }

  subject(:response) { described_class.new(user).get(utr: "2234567890", tax_year: "2014-15") }

  before do
    stub_request(:get, url).
      with(headers: {"Authorization" => "Bearer faketoken"}).
      to_return(
        body: "{\"class1\":{\"totalNICableEarnings\":10.00},\"class2\":{\"totalDue\":20.00},\"maxNICsReached\":false}",
        status: 200,
        headers: {
          "content-type"=>"application/json; charset=utf-8",
          "content-length"=>"92",
        })
  end

  it "can parse the response" do
    expect(response.json).to eq({
      "class1" => {"totalNICableEarnings" => 10.0},
      "class2" => {"totalDue" => 20.0},
      "maxNICsReached" => false
    })
  end
end
