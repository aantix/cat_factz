class TransmitCatFactsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :incoming

  def incoming
    TransmitCatFact.create!(:phonenumber => params["From"],
                            :message => params['Body'],
                            :sentreceived => 'received')
  end

  def create
    # Send cat fact to Twilio.
    @cat_fact = TransmitCatFact.start(params[:dial], CatFact.random)

    redirect_to @cat_fact
  end

  def show
    @cat_fact = TransmitCatFact.find(params[:id])
    @all_cat_facts = TransmitCatFact.find_all_by_phonenumber(@cat_fact.phonenumber)
  end

end
