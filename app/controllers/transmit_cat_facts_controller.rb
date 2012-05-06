class TransmitCatFactsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :incoming

  def incoming
    from = User.cleanup_phonenumber(params["From"])
    user = User.find_by_phonenumber(from) ||
      User.create(:phonenumber => from)
    msg = TransmitCatFact.create!(:user_id => user.id, :message => params['Body'],
                            :sentreceived => 'received')
    CatFact.new(user, msg).respond
    render :text => "Meow"
  end

  def create
    # Send cat fact to Twilio.
    # cat_fact = CatFact.signup(number)
    to = params[:transmit_cat_fact][:dial]
    unless @user = User.find_by_phonenumber(User.cleanup_phonenumber(to))
      @user = User.create(:phonenumber => to)
      cat_fact = CatFact.new(@user)
      cat_fact.signup
    end
    redirect_to @user
  end

end
