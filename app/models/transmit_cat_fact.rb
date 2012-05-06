class TransmitCatFact < ActiveRecord::Base
  attr_accessor :dial
  attr_accessible :message, :phonenumber, :sentreceived
end
