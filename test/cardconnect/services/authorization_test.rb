require 'test_helper'

describe Service::Authorization do
  before do
    @service = Service::Authorization.new
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/auth'
  end
end
