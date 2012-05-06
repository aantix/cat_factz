class TransmitCatFactsController < ApplicationController
  # GET /transmit_cat_facts
  # GET /transmit_cat_facts.json
  def index
    @transmit_cat_facts = TransmitCatFact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transmit_cat_facts }
    end
  end

  # GET /transmit_cat_facts/1
  # GET /transmit_cat_facts/1.json
  def show
    @transmit_cat_fact = TransmitCatFact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transmit_cat_fact }
    end
  end

  # GET /transmit_cat_facts/new
  # GET /transmit_cat_facts/new.json
  def new
    @transmit_cat_fact = TransmitCatFact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transmit_cat_fact }
    end
  end

  # GET /transmit_cat_facts/1/edit
  def edit
    @transmit_cat_fact = TransmitCatFact.find(params[:id])
  end

  # POST /transmit_cat_facts
  # POST /transmit_cat_facts.json
  def create
    @transmit_cat_fact = TransmitCatFact.new(params[:transmit_cat_fact])

    respond_to do |format|
      if @transmit_cat_fact.save
        format.html { redirect_to @transmit_cat_fact, notice: 'Transmit cat fact was successfully created.' }
        format.json { render json: @transmit_cat_fact, status: :created, location: @transmit_cat_fact }
      else
        format.html { render action: "new" }
        format.json { render json: @transmit_cat_fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transmit_cat_facts/1
  # PUT /transmit_cat_facts/1.json
  def update
    @transmit_cat_fact = TransmitCatFact.find(params[:id])

    respond_to do |format|
      if @transmit_cat_fact.update_attributes(params[:transmit_cat_fact])
        format.html { redirect_to @transmit_cat_fact, notice: 'Transmit cat fact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transmit_cat_fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transmit_cat_facts/1
  # DELETE /transmit_cat_facts/1.json
  def destroy
    @transmit_cat_fact = TransmitCatFact.find(params[:id])
    @transmit_cat_fact.destroy

    respond_to do |format|
      format.html { redirect_to transmit_cat_facts_url }
      format.json { head :no_content }
    end
  end
end
