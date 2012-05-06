require 'rubygems'
require 'twilio-ruby'
require 'gibberish'

# put your own credentials here
account_sid = 'AC866cb978fcd2a9ac7ec88ea7e0ac08bc'
cipher = Gibberish::AES.new(ENV["PASSCODE"])
auth_token = cipher.dec("U2FsdGVkX180haB0kdtOBwGJCsUW8Sxk+A6SsKBIWOxSDh/6riRS8E6h/77Z\nwDAYTY23yabXXBHB+8ks44gyBg==\n")
#
# # set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
