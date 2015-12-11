require "spec_helper"
require "marcy/user_resource"

describe Marcy::UserResource do
  class FakeUserResource < described_class
    ENDPOINT = "/test"
  end

  before do
    stub_request(:get, "https://api.service.hmrc.gov.uk/test").
      with(headers: {
      "Authorization" => "Bearer faketoken",
      "Accept" => "application/vnd.hmrc.1.0+json"
      }).
      to_return(
        body: "",
        status: 200,
        headers: {
          "content-type"=>"application/json; charset=utf-8",
          "content-length"=>"25",
        })
  end

  let(:user) { Marcy::User.new(access_token: "faketoken") }
  subject(:response) { FakeUserResource.new(user).get }

  it "makes the correct request" do
    expect(response.status).to eq 200
  end
end
