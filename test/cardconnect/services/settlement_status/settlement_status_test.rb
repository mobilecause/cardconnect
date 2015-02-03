require 'test_helper'

describe Service::SettlementStatus do
  before do
    @connection = Connection.new.connection do |stubs|
      stubs.get(@service.path) { [200, {}, valid_settlestat_response] }
    end
    @service = Service::SettlementStatus.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/settlestat'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_settlestat_request
    end

    after do
      @valid_params = nil
    end

    it 'creates a Capture request object with the passed in params' do
      @service.build_request(@valid_params)

      @service.request.must_be_kind_of String
      @service.request.must_include "merchid=000000927996"
      @service.request.must_include "date=0110"
    end

    it 'uses default merchant ID if merchid is not passed in' do
      @service.build_request(@valid_params.reject!{|k,v| k == 'merchid' })
      @service.request.must_be_kind_of String
      @service.request.must_include "merchid=merchant123"
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      @service.request.nil?.must_equal true
      proc { @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_settlestat_request)
      @service.submit
      @service.response.must_be_kind_of SettlementStatusResponse
    end
  end
end
