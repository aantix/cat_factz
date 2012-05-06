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
    @cat_fact = TransmitCatFact.start(params[:dial], CatFact.random)

    redirect_to @cat_fact
  end

  def show
    @cat_fact      = TransmitCatFact.find(params[:id])
    @all_cat_facts = TransmitCatFact.find_all_by_phonenumber(@cat_fact.phonenumber)
  end

end
