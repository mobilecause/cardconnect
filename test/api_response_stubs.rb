
def valid_auth_response
  {
      "respstat" => "A",
      "account" => "41XXXXXXXXXX1111",
      "token" => "9419786452781111",
      "retref" => "343005123105",
      "amount" => "111",
      "merchid" => "020594000000",
      "respcode" => "00",
      "resptext" => "Approved",
      "avsresp" => "9",
      "cvvresp" => "M",
      "authcode" => "046221",
      "respproc" => "FNOR"
  }
end

def valid_capture_response
  {
    "amount" => "596.00",
    "setlstat" => "Pending",
    "retref" => "288002073633",
    "merchid" => "000000927996",
    "account" => "41XXXXXXXXXX4113"
  }
end

def valid_inquire_response
  {
    "amount" => "596.00",
    "resptext" => "Approval",
    "setlstat" => "NOTCAPTURED",
    "authcode" => "PPS272",
    "respcode" => "00",
    "retref" => "288015190411",
    "merchid" => "000000927996",
    "cvvresp" => "M",
    "account" => "41XXXXXXXXXX4113",
    "avsresp" => "Z",
    "respproc" => "FNOR",
    "respstat" => "A"
  }
end

def valid_settlestat_response
  [
    {
      "txns" => [
        {
          "setlstat" => "N",
          "retref" => "179001161341"
        },
        {
          "setlstat" => "Y",
          "retref" => "179002161341"
        }
      ],
      "batchid" => "71742042",
      "hoststat" => "GB",
      "hostbatch" => "71742041"
    }
  ]
end

def valid_refund_response
  {
      "amount" => "59.60",
      "resptext" => "Approval",
      "authcode" => "REFUND",
      "respcode" => "00",
      "retref" => "288010185242",
      "merchid" => "000000927996",
      "cvvresp" => "M",
      "account" => "41XXXXXXXXXX4113",
      "avsresp" => "Z",
      "respproc" => "PPS",
      "respstat" => "A"
  }
end