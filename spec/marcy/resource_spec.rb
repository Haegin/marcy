require "spec_helper"
require "marcy/resource"

describe Marcy::Resource do
  class FakeResource < described_class
    ENDPOINT = "/test"
  end

  before do
    stub_request(:get, "https://api.service.hmrc.gov.uk/test").
      with(headers: {"Accept" => "application/vnd.hmrc.1.0+json"}).
      to_return(
        body: "",
        status: 200,
        headers: {
          "content-type"=>"application/json; charset=utf-8",
          "content-length"=>"25",
        })
  end

  subject(:response) { FakeResource.new.get }

  it "makes the correct request" do
    expect(response.status).to eq 200
  end
end
