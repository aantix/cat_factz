class CatFact

  def initialize(user, incoming_message=nil)
    @client = TWILIO
    @user = user
    @incoming_message = incoming_message
    if incoming_message
      incoming_message.update_attribute :user_id, user.id
    end
  end

  def respond
    if !@incoming_message && @user.transmit_cat_facts.where("sentreceived = 'sent'").count > 0
      sms(cat_fact)
    elsif @incoming_message && @user.transmit_cat_facts.where("sentreceived = 'sent'").count == 0
      signup
    else
      sms(error_message)
    end
  end

  def signup
    sms("Welcome to cat facts, you signed up to recieve one cat fact per hour. Meow")
    sms(cat_fact)
  end

  def sms(message)
    TransmitCatFact.create(:user_id => @user.id, :message => message, :sentreceived => 'sent')
    @client.account.sms.messages.create(
      :from => '+12029050634',
      :to => "#{@user.phonenumber}",
      :body => message
    )
    message
  end

  private

  def cat_fact
    [
      "Cats can't taste sugary foods due to a faulty sweet receptor gene",
      "Cats are the only mammals with gils",
      "Cats are capable of as many as 100 different vocalizations, compared to about 10 for dogs.",
      "Some cats have been known to reach up to 23 kg (50 pounds) due to overfeeding.",
      "Indoor cats typically live 14 to 20 years although the oldest-known cat lived to an amazing age of 36.",
      "Cats, in some cases, can sleep as much as 20 hours in a 24-hour period.",
      "Cats at rest  have an average heart rate between 150 and 180 bpm"
    ].shuffle.first
  end

  def error_message
    [
      "I'm sorry, I didn't understand that last command. Respond 'meow' for help",
      "You must be a real cat fancier! You will now recieve one cat fact every 15 minutes. Meow!",
      "Meow, meow meow. Meow-meow meow meow meow meeeyow."
    ].shuffle.first
  end
end
