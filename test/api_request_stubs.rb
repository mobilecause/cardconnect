def valid_auth_request
  {
      "merchid" => "000000927996",
      "accttype" => "VISA",
      "orderid" => "AB-11-9876",
      "account" => "4111111111111111",
      "expiry" => "1212",
      "amount" => "0",
      "currency" => "USD",
      "name" => "TOM JONES",
      "address" => "123 MAIN STREET",
      "city" => "anytown",
      "region" => "NY",
      "country" => "US",
      "postal" => "55555",
      "phone" => "3334445555",
      "email" => "tom@jones.com",
      "ecomind" => "E",
      "cvv2" => "123",
      "track" => "Y",
      "tokenize" => "Y",
      "capture" => "Y",
      "bankaba" => "1010101",
      "termid" => "12345",
      "ssnl4" => "1234",
      "license" => "CO:1231231234",
      "profile" => "Y",
      "userfields" => [
          {
              "name0" => "value0"
          },
          {
              "name1" => "value1"
          }
      ]
  }
end

def valid_capture_request
  {
      "retref" => "288002073633",
      "amount" => "596.00",
      "taxamnt" => "40.00",
      "merchid" => "000000927996",
      "ponumber" => "PO-0736332",
      "authcode" => "046221",
      "invoiceid" => "7890"
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
      "merchid" => "000000927996",
      "date" => "0110"
  }
end

def valid_refund_request
  {
      "retref" => "288009185241",
      "merchid" => "000000927996",
      "amount" => "59.60"
  }
end

def valid_deposit_request
  valid_settlestat_request
end

def valid_void_request
  {
      "retref" => "288013185633",
      "merchid" => "000000927996",
      "amount" => "101"
  }
end