class TransmitCatFactsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :incoming

  def incoming
    msg = TransmitCatFact.create!(:message => params['Body'],
                            :sentreceived => 'received')
    if user = User.find_by_phonenumber(params["From"])
      CatFact.new(user, msg).respond
    else
      user = User.create(:phonenumber => params["From"])
      CatFact.new(user, msg).signup
    end
    render :text => "Meow"
  end

  def create
    # Send cat fact to Twilio.
    # cat_fact = CatFact.signup(number)
    @user = User.create(:phonenumber => params[:dial])

    cat_fact = CatFact.new(@user)
    message = cat_fact.send_intro

    redirect_to @user
  end

end
