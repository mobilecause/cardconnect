
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
