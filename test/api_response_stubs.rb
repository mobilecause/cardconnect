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
    'profileid' => '12345678',
    'acctid' => nil
  }
end

def valid_capture_response
  {
    'amount' => '596.00',
    'setlstat' => 'Pending',
    'retref' => '288002073633',
    'merchid' => '000000927996',
    'account' => '41XXXXXXXXXX4113',
    'respproc' => 'FNOR',
    'resptext' => 'Approval',
    'respstat' => 'A',
    'respcode' => '00',
    'batchid' => '1900941569',
    'token' => '9418594164541111',
    'commcard' => ' C '
  }
end
def valid_inquire_response # rubocop:disable Metrics/MethodLength
  {
    'amount' => '596.00',
    'resptext' => 'Approval',
    'setlstat' => 'Accepted',
    'respcode' => '00',
    'retref' => '288015190411',
    'merchid' => '000000927996',
    'account' => '9418594164541111',
    'respproc' => 'FNOR',
    'respstat' => 'A',
    'currency' => 'USD',
    'token' => '9418594164541111',
    'authdate' => '20180410',
    'lastfour' => '1111',
    'name' => 'TOM JONES',
    'capturedate' => '20180326065748',
    'batchid' => '1900941569',
    'settledate' => '20180327143721'
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

def valid_profile_get_response #rubocop:disable Metrics/MethodLength
  {
    "resptext" => 'Profile found',
    "respcode" => 'A',
    "respstat" => 'B',
    "respproc" => "PPS",
    "account" => '41XXXXXXXXXX1111',
    "defaultacct" => "12345",
    "ssnl4" => "1234",
    "email" => 'test@test.com',
    "phone" => "7778789999",
    "region" => "AK",
    "postal" => "19090",
    "address" => "123 MAIN STREET",
    "accttype" => "VISA",
    "token" => "9440670166031111",
    "name" => "TOM JONES",
    "license" => "123451254",
    "country" => "US",
    "city" => "ANYTOWN",
    "expiry" => "0214",
    "profileid" => "12345678901234567890",
    "acctid" => "1",
    "gsacard" => "N",
    "auoptout" => "N"
  }
end

def valid_profile_delete_response #rubocop:disable Metrics/MethodLength
  {
    "resptext" => "Profile Deleted",
    "respcode" => "08",
    "profileid" => "12345678901234567890",
    "acctid" => "1",
    "respproc" => "PPS",
    "respstat" => "A"
  }
end

def valid_profile_put_response #rubocop:disable Metrics/MethodLength
  {
    "country" => "US",
    "address" => "123 MAIN STREET",
    "resptext" => "Profile Saved",
    "city" => "ANYTOWN",
    "acctid" => "1",
    "respcode" => "09",
    "defaultacct" => "Y",
    "accttype" => "VISA",
    "token" => "9441149619831111",
    "account" => "41XXXXXXXXXX1111",
    "email" => "test@test.com",
    "license" => "123451254",
    "respproc" => "PPS",
    "phone" => "7778789999",
    "profileid" => "12305454023615201322",
    "name" => "TOM JONES",
    "auoptout" => "N",
    "postal" => "19090",
    "expiry" => "0214",
    "region" => "AK",
    "ssnl4" => "3655",
    "respstat" => "A",
    "gsacard" => "N"
  }
end

def valid_bin_response
  {
    "country" => "USA",
    "product" => "V",
    "cardusestring" => "True credit",
    "gsa" => false,
    "corporate" => true,
    "fsa" => false,
    "subtype" => "Visa Corporate T&E",
    "purchase" => false,
    "prepaid" => false,
    "binlo" => "478823XXX",
    "issuer" => "JPMorgan Chase Bank N.A. - Commercial",
    "binhi" => "478825XXX"
  }
end
