require 'test_helper'

describe CardConnect::Service::DepositResponse do
  before do
    @response = CardConnect::Service::DepositResponse.new(valid_deposit_response)
  end

  after do
    @response = nil
  end

  it 'should have the deposit id' do
    @response.depositid.must_equal 7
  end

  it 'should have the merchant id' do
    @response.merchid.must_equal '000000927996'
  end

  it 'should have the respproc' do
    @response.respproc.must_equal 'FNOR'
  end

  it 'should have the accttype' do
    @response.accttype.must_equal 'VI'
  end

  it 'should have the action' do
    @response.action.must_equal 'DEB'
  end

  it 'should have the actdate' do
    @response.actdate.must_equal '20121008'
  end

  it 'should have the postdate' do
    @response.postdate.must_equal '20121009'
  end

  it 'should have the currency' do
    @response.currency.must_equal 'USD'
  end

  it 'should have the amount' do
    @response.amount.must_equal '11.00'
  end

  it 'should have the feeamnt' do
    @response.feeamnt.must_equal '0.55'
  end

  it 'should have the cbakamnt' do
    @response.cbakamnt.must_equal '0.00'
  end

  it 'should have the resptext' do
    @response.resptext.must_equal 'Successful or something'
  end

  it 'should have the transactions' do
    @response.txns.must_equal [{ merchbatch: 92821429, retref: '282005142924', hostbatch: '1429',
                                 feeamnt: '0.00', action: 'DEB', depamnt: '11.00' }]
  end

  describe '#body' do
    it 'should have all the right fields in the body' do
      @response.body.keys.must_equal [:depositid, :merchid, :respproc, :accttype, :action, :actdate,
                                      :postdate, :currency, :amount, :feeamnt, :cbakamnt, :resptext, :txns]
    end

    it 'should generate hash with all the right values' do
      valid_payload = symbolize_keys(valid_deposit_response.first)
      valid_payload[:txns] = valid_payload[:txns].map { |txn| symbolize_keys(txn) }
      @response.body.must_equal valid_payload
    end
  end
end
