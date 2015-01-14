require 'test_helper'

describe Service::Capture do
  before do
    @connection = Connection.new.connection do |stubs|
      stubs.put(@service.path) { [200, {}, valid_capture_response] }
    end
    @service = Service::Capture.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/capture'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_capture_request
    end

    after do
      @valid_params = nil
    end

    it 'adds the merchant id to the params' do
      @service.build_request(@valid_params)
      @service.request.merchid.must_equal CardConnect.configuration.merchant_id
    end

    it 'creates a Capture request object with the right params' do
      @service.build_request(@valid_params)

      @service.request.must_be_kind_of CaptureRequest

      @service.request.merchid.must_equal 'merchant123'
      @service.request.retref.must_equal '288002073633'
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      @service.request.nil?.must_equal true
      proc { @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_capture_request)
      @service.submit
      @service.response.must_be_kind_of CaptureResponse
    end
  end
end
