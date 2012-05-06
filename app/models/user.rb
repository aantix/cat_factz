class User < ActiveRecord::Base
  has_many :transmit_cat_facts
  attr_accessible :phonenumber
end
