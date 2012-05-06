class TransmitCatFactsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :incoming

  def incoming
    #TransmitCatFact.create!(:phonenumber => params["From"],
                            #:message => params['Body'],
                            #:sentreceived => 'received')
    response = CatFact.send_error(params["From"], params['Body'])
    #TransmitCatFact.create!(:phonenumber => params["From"],
                            #:message => response,
                            #:sentreceived => 'send')
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
