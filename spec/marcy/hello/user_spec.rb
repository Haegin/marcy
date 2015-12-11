require "spec_helper"
require "marcy/user"
require "marcy/hello/user"

describe Marcy::Hello::User do
  before do
    stub_request(:get, "https://api.service.hmrc.gov.uk/hello/user").
      with(headers: {"Authorization" => "Bearer faketoken"}).
      to_return(
        body: "{\"message\":\"Hello Sandbox User\"}",
        status: 200,
        headers: {
          "content-type"=>"application/json; charset=utf-8",
          "content-length"=>"32",
        })
  end

  let(:user) { Marcy::User.new(access_token: "faketoken") }
  subject(:response) { described_class.new(user).get }

  it "can parse the response" do
    expect(response.json).to eq({"message" => "Hello Sandbox User"})
  end
end
