require "spec_helper"
require "marcy/hello/world"

describe Marcy::Hello::World do
  before do
    stub_request(:get, "https://api.service.hmrc.gov.uk/hello/world").
      to_return(
        body: "{\"message\":\"Hello World\"}",
        status: 200,
        headers: {
          "content-type"=>"application/json; charset=utf-8",
          "content-length"=>"25",
        })
  end

  subject(:response) { described_class.new.get }

  it "can parse the response" do
    expect(response.json).to eq({"message" => "Hello World"})
  end
end
