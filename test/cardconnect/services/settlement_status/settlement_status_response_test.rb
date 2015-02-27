require 'test_helper'

describe CardConnect::Service::SettlementStatusResponse do
  before do
    @response = CardConnect::Service::SettlementStatusResponse.new(valid_settlestat_response)
  end

  after do
    @response = nil
  end

  it 'should have the merchant id' do
    @response.merchid.must_equal "000000927996"
  end

  it 'should have the batch id' do
    @response.batchid.must_equal "71742042"
  end

  it 'should have the settlement status' do
    @response.hoststat.must_equal "GB"
  end

  it 'should have the host batch id' do
    @response.hostbatch.must_equal "71742041"
  end

  it 'should have the clearing house' do
    @response.respproc.must_equal "FNOR"
  end

  it 'should have the transactions' do
    @response.txns.must_equal [{setlstat: "N", retref: "179001161341"}, {setlstat: "Y", retref: "179002161341"}]
  end

  describe '#body' do
    it 'should have all the right fields in the body' do
      @response.body.keys.must_equal [:merchid, :batchid, :hoststat, :hostbatch, :respproc, :txns]
    end

    it 'should generate hash with all the right values' do
      valid_payload = symbolize_keys(valid_settlestat_response.first)
      valid_payload[:txns] = valid_payload[:txns].map{|txn| symbolize_keys(txn)}
      @response.body.must_equal valid_payload
    end
  end
end