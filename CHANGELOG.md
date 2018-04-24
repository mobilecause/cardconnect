# Changelog

## v2.3.0

* Added the following fields to response objects (@shivashankar-ror):
  - CaptureResponse: `:respproc, :resptext, :commcard, :respstat, :respcode, :batchid, :token`
  - InquireResponse: `:capturedate, :batchid, :token, :authdate, :lastfour, :name, :currency, :settledate`
  - ProfileGetResponse: `:gsacard, :auoptout`

* Added support for Bin Service (@shivashankar-ror)

## v2.2.0

* Add `token` field to Profile Service for create/update responses since this field can potentially be included in the response if a token hadn't already been created for that particular profile. (@mauriciozaffari)

## v2.1.0

* Add ability to pass connection options to the Faraday connection (@jhanggi)

## v2.0.1

* Upgrades `faraday` and `faraday_middleware` dependency versions

## v2.0.0

* Added support for Profile Service (@AndreiBujenitsa)
* Removes Deposit Service support

## v1.1.1

* Reintroduced Capture and Inquire settlement status constants to resolve some compatibility issues

## v1.1.0

* Adding the `profileid` to the Authorization Response.
* Added fields necessary for Authorization Capture requests

## v1.0.0

* First version! Don't downgrade from here!
