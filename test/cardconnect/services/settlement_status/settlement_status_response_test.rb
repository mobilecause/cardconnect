require 'test_helper'

describe SettlementStatusResponse do
  before do
    @response = SettlementStatusResponse.new(valid_settlestat_response)
    @valid_payload = symbolize_keys(valid_settlestat_response.first)
    @valid_payload[:txns] = @valid_payload[:txns].map{|txn| symbolize_keys(txn)}
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  it 'should have the merchant id' do
    @response.merchid.must_equal @valid_payload[:merchid]
  end

  it 'should have the batch id' do
    @response.batchid.must_equal @valid_payload[:batchid]
  end

  it 'should have the settlement status' do
    @response.hoststat.must_equal @valid_payload[:hoststat]
  end

  it 'should have the host batch id' do
    @response.hostbatch.must_equal @valid_payload[:hostbatch]
  end

  it 'should have the clearing house' do
    @response.respproc.must_equal @valid_payload[:respproc]
  end

  it 'should have the transactions' do
    @response.txns.each_with_index do |txn, i|
      txn.must_equal @valid_payload[:txns][i]
    end
  end

  describe '#body' do
    it 'should have all the right fields in the body' do
      @response.body.keys.must_equal [:merchid, :batchid, :hoststat, :hostbatch, :respproc, :txns]
    end

    it 'should generate hash with all the right values' do
      @response.body.keys.each do |k|
        @response.body[k].must_equal @valid_payload[k]
      end
    end
  end
end