class TransmitCatFactsController < ApplicationController

  def received_message
    TransmitCatFact.create!(:phonenumber => params[:phonenumber],
                            :message => param[:message],
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
