require 'test_helper'

describe CardConnect::Service::Capture do
  before do
    @connection = CardConnect::Connection.new.connection do |stubs|
      stubs.put(@service.path) { [200, {}, valid_capture_response] }
    end
    @service = CardConnect::Service::Capture.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    _(@service.path).must_equal '/cardconnect/rest/capture'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_capture_request
    end

    after do
      @valid_params = nil
    end

    it 'creates a Capture request object with the passed in params' do
      @service.build_request(@valid_params)

      _(@service.request).must_be_kind_of CardConnect::Service::CaptureRequest

      _(@service.request.merchid).must_equal '000000927996'
      _(@service.request.retref).must_equal '288002073633'
    end

    it 'uses default merchant ID if merchid is not passed in' do
      @service.build_request(@valid_params.reject! { |k, _| k == 'merchid' })
      _(@service.request).must_be_kind_of CardConnect::Service::CaptureRequest
      _(@service.request.merchid).must_equal 'merchant123'
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      _(@service.request.nil?).must_equal true
      _{ @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_capture_request)
      @service.submit
      _(@service.response).must_be_kind_of CardConnect::Service::CaptureResponse
    end
  end
end
