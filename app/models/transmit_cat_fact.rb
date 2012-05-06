class TransmitCatFact < ActiveRecord::Base
  attr_accessor :dial
  attr_accessible :message, :sentreceived, :user_id
end
