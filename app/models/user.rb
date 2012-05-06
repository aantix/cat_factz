class User < ActiveRecord::Base
  has_many :transmit_cat_facts
  attr_accessible :phonenumber
  before_validation :cleanup_phonenumber

  def self.cleanup_phonenumber(number)
    number = number.gsub('-','')
    unless number.match(/^\+1/)
      number = "+1#{number}"
    end
    number
  end

  def cleanup_phonenumber
    self.phonenumber = User.cleanup_phonenumber(self.phonenumber)
  end

  def self.cron_send_facts
    users = User.all

    users.each do |user|
      cat_fact = CatFact.new(user)
      cat_fact.respond
    end

  end
end
