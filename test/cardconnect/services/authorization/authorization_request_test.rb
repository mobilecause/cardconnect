require 'test_helper'

describe AuthorizationRequest do
  before do
    @request = AuthorizationRequest.new
  end

  after do
    @request = nil
  end

  describe "#payload" do
    def valid_params
      {
          merchid: "123",
          account: "4111111111111111",
          expiry: "122015",
          amount: "40.00",
          currency: "USD",
          accttype: nil,
          name: "Bob Denver",
          address: "123 Fake St.",
          city: "Anytown",
          region: "MA",
          country: "USA",
          phone: "9993334444",
          postal: nil,
          email: "bob@example.com",
          ecomind: nil,
          cvv2: nil,
          orderid: nil,
          track: nil,
          bankaba: nil,
          tokenize: nil,
          termid: nil,
          capture: nil
      }
    end

    before do
      @request = AuthorizationRequest.new(valid_params)
    end

    it 'should generate JSON with all the right values' do
      @request.payload.must_equal valid_params
    end
  end
end
