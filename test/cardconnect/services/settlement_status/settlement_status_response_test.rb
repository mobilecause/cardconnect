require 'test_helper'

describe SettlementStatusResponse do
  before do
    @response = SettlementStatusResponse.new(valid_settlestat_response)
    @valid_payload = valid_settlestat_response.first
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  it 'should have the merchant id' do
    @response.merchid.must_equal @valid_payload['merchid']
  end

  it 'should have the batch id' do
    @response.batchid.must_equal @valid_payload['batchid']
  end

  it 'should have the settlement status' do
    @response.hoststat.must_equal @valid_payload['hoststat']
  end

  it 'should have the host batch id' do
    @response.hostbatch.must_equal @valid_payload['hostbatch']
  end

  it 'should have the clearing house' do
    @response.respproc.must_equal @valid_payload['respproc']
  end

  it 'should have the transactions' do
    @response.txns.each_with_index do |txn, i|
      txn.must_equal symbolize_keys(@valid_payload['txns'][i])
    end
  end

  describe '#body' do
    it 'should have all the right fields in the body' do
      @response.body.keys.must_equal [:merchid, :batchid, :hoststat, :hostbatch, :respproc, :txns]
    end
  end
end