class WelcomesController < ApplicationController
  def index
     @transmit_cat_factz = TransmitCatFact.new
  end
end