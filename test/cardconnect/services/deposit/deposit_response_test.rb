require 'test_helper'

describe CardConnect::Service::DepositResponse do
  before do
    @response = CardConnect::Service::DepositResponse.new(valid_deposit_response)
    @valid_payload = symbolize_keys(valid_deposit_response.first)
    @valid_payload[:txns] = @valid_payload[:txns].map{|txn| symbolize_keys(txn)}
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  it 'should have the deposit id' do
    @response.depositid.must_equal @valid_payload[:depositid]
  end

  it 'should have the merchant id' do
    @response.merchid.must_equal @valid_payload[:merchid]
  end

  it 'should have the respproc' do
    @response.respproc.must_equal @valid_payload[:respproc]
  end

  it 'should have the accttype' do
    @response.accttype.must_equal @valid_payload[:accttype]
  end

  it 'should have the action' do
    @response.action.must_equal @valid_payload[:action]
  end

  it 'should have the actdate' do
    @response.actdate.must_equal @valid_payload[:actdate]
  end

  it 'should have the postdate' do
    @response.postdate.must_equal @valid_payload[:postdate]
  end

  it 'should have the currency' do
    @response.currency.must_equal @valid_payload[:currency]
  end

  it 'should have the amount' do
    @response.amount.must_equal @valid_payload[:amount]
  end

  it 'should have the feeamnt' do
    @response.feeamnt.must_equal @valid_payload[:feeamnt]
  end

  it 'should have the cbakamnt' do
    @response.cbakamnt.must_equal @valid_payload[:cbakamnt]
  end

  it 'should have the resptext' do
    @response.resptext.must_equal @valid_payload[:resptext]
  end

  it 'should have the transactions' do
    @response.txns.each_with_index do |txn, i|
      txn.must_equal @valid_payload[:txns][i]
    end
  end

  describe '#body' do
    it 'should have all the right fields in the body' do
      @response.body.keys.must_equal [:depositid, :merchid, :respproc, :accttype, :action, :actdate, :postdate, :currency, :amount, :feeamnt, :cbakamnt, :resptext, :txns]
    end

    it 'should generate hash with all the right values' do
      @response.body.keys.each do |k|
        @response.body[k].must_equal @valid_payload[k]
      end
    end
  end
end