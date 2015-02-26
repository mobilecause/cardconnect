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

def valid_deposit_response
  [
      {
          "cardtype" => "VI",
          "postdate" => "20121009",
          "cbakamnt" => "0.00",
          "feeamnt" => "0.55",
          "currency" => "USD",
          "amount" => "11.00",
          "txns" => [
              {
                  "merchbatch" => 92821429,
                  "retref" => "282005142924",
                  "hostbatch" => "1429",
                  "feeamnt" => "0.00",
                  "action" => "DEB",
                  "depamnt" => "11.00"
              }
          ],
          "resptext" => "",
          "depositid" => 7,
          "merchid" => "000000927996",
          "action" => "DEB",
          "actdate" => "20121008",
          "cardproc" => "FNOR"
      },
      {
          "cardtype" => "MC",
          "postdate" => "20121009",
          "cbakamnt" => "0.00",
          "feeamnt" => "0.55",
          "currency" => "USD",
          "amount" => "11.00",
          "txns" => [
              {
                  "merchbatch" => 92821429,
                  "retref" => "282006142924",
                  "hostbatch" => "1429",
                  "feeamnt" => "0.00",
                  "action" => "DEB",
                  "depamnt" => "11.00"
              }
          ],
          "resptext" => "",
          "depositid" => 7,
          "merchid" => "000000927996",
          "action" => "DEB",
          "actdate" => "20121008",
          "cardproc" => "FNOR"
      }
  ]
end