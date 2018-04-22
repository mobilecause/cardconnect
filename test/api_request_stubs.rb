def valid_auth_request # rubocop:disable Metrics/MethodLength
  {
    'merchid' => '000000927996',
    'accttype' => 'VISA',
    'orderid' => 'AB-11-9876',
    'account' => '4111111111111111',
    'expiry' => '1212',
    'amount' => '0',
    'currency' => 'USD',
    'name' => 'TOM JONES',
    'address' => '123 MAIN STREET',
    'city' => 'anytown',
    'region' => 'NY',
    'country' => 'US',
    'postal' => '55555',
    'phone' => '3334445555',
    'email' => 'tom@jones.com',
    'ecomind' => 'E',
    'cvv2' => '123',
    'track' => 'Y',
    'tokenize' => 'Y',
    'capture' => 'Y',
    'bankaba' => '1010101',
    'termid' => '12345',
    'ssnl4' => '1234',
    'license' => 'CO:1231231234',
    'profile' => 'Y',
    'ponumber' => '1234',
    'authcode' => '123456',
    'invoiceid' => '000000000001',
    'taxamnt' => '0',
    'userfields' => [
      {
        'name0' => 'value0'
      },
      {
        'name1' => 'value1'
      }
    ]
  }
end

def valid_capture_request
  {
    'retref' => '288002073633',
    'amount' => '596.00',
    'taxamnt' => '40.00',
    'merchid' => '000000927996',
    'ponumber' => 'PO-0736332',
    'authcode' => '046221',
    'invoiceid' => '7890'
  }
end

def valid_inquire_request
  {
    'retref' => '288002073633',
    'merchid' => '000000927996'
  }
end

def valid_settlestat_request
  {
    'merchid' => '000000927996',
    'date' => '0110'
  }
end

def valid_refund_request
  {
    'retref' => '288009185241',
    'merchid' => '000000927996',
    'amount' => '59.60'
  }
end

def valid_void_request
  {
    'retref' => '288013185633',
    'merchid' => '000000927996',
    'amount' => '101'
  }
end

def valid_profile_request
  {
    'profileid' => '12345678901234567890',
    'acctid' => '1',
    'merchid' => '000000927996'
  }
end

def valid_profile_put_request
  {
    "region" => "AK",
    "phone" => "7778789999",
    "accttype" => "VISA",
    "postal" => "19090",
    "ssnl4" => "3655",
    "expiry" => "0214",
    "city" => "ANYTOWN",
    "country" => "US",
    "address" => "123 MAIN STREET",
    "merchid" => '000000927996',
    "profileid" => '12345678901234567890',
    "profile" => '12345678901234567890acctid',
    "bankaba" => '1234567',
    "email" => 'test@email.com',
    "name" => "TOM JONES",
    "account" => "4444333322221111",
    "license" => "123451254",
    "defaultacct" => "N",
    "profileupdate" => "Y"
  }
end

def valid_bin_request
  {
    'token' => '9477709629051443',
    'merchid' => '000000927996'
  }
end