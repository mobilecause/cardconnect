def valid_auth_response # rubocop:disable Metrics/MethodLength
  {
    'respstat' => 'A',
    'account' => '41XXXXXXXXXX1111',
    'token' => '9419786452781111',
    'retref' => '343005123105',
    'amount' => '111',
    'merchid' => '020594000000',
    'respcode' => '00',
    'resptext' => 'Approved',
    'avsresp' => '9',
    'cvvresp' => 'M',
    'authcode' => '046221',
    'respproc' => 'FNOR',
    'commcard' => 'N',
    'profileid' => '12345678'
  }
end

def valid_capture_response
  {
    'amount' => '596.00',
    'setlstat' => 'Pending',
    'retref' => '288002073633',
    'merchid' => '000000927996',
    'account' => '41XXXXXXXXXX4113'
  }
end

def valid_inquire_response # rubocop:disable Metrics/MethodLength
  {
    'amount' => '596.00',
    'resptext' => 'Approval',
    'setlstat' => 'NOTCAPTURED',
    'respcode' => '00',
    'retref' => '288015190411',
    'merchid' => '000000927996',
    'account' => '41XXXXXXXXXX4113',
    'respproc' => 'FNOR',
    'respstat' => 'A',
    'currency' => 'USD'
  }
end

def valid_settlestat_response # rubocop:disable Metrics/MethodLength
  [
    {
      'txns' => [
        { 'setlstat' => 'N', 'retref' => '179001161341' },
        { 'setlstat' => 'Y', 'retref' => '179002161341' }
      ],
      'batchid' => '71742042',
      'hoststat' => 'GB',
      'merchid' => '000000927996',
      'hostbatch' => '71742041',
      'respproc' => 'FNOR'
    }
  ]
end

def valid_refund_response
  {
    'amount' => '59.60',
    'resptext' => 'Approval',
    'authcode' => 'REFUND',
    'respcode' => '00',
    'retref' => '288010185242',
    'merchid' => '000000927996',
    'respproc' => 'PPS',
    'respstat' => 'A'
  }
end

def valid_deposit_response # rubocop:disable Metrics/MethodLength
  [
    {
      'accttype' => 'VI',
      'postdate' => '20121009',
      'cbakamnt' => '0.00',
      'feeamnt' => '0.55',
      'currency' => 'USD',
      'amount' => '11.00',
      'respproc' => 'FNOR',
      'txns' => [
        {
          'merchbatch' => 92821429,
          'retref' => '282005142924',
          'hostbatch' => '1429',
          'feeamnt' => '0.00',
          'action' => 'DEB',
          'depamnt' => '11.00'
        }
      ],
      'resptext' => 'Successful or something',
      'depositid' => 7,
      'merchid' => '000000927996',
      'action' => 'DEB',
      'actdate' => '20121008'
    }
  ]
end

def valid_void_response # rubocop:disable Metrics/MethodLength
  {
    'amount' => '1.01',
    'resptext' => 'Approval',
    'authcode' => 'REVERS',
    'respcode' => '00',
    'retref' => '288013185633',
    'merchid' => '000000927996',
    'respproc' => 'FNOR',
    'respstat' => 'A',
    'currency' => 'USD'
  }
end
