require 'test_helper'

class TransmitCatFactsControllerTest < ActionController::TestCase
  setup do
    @transmit_cat_fact = transmit_cat_facts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transmit_cat_facts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transmit_cat_fact" do
    assert_difference('TransmitCatFact.count') do
      post :create, transmit_cat_fact: { message: @transmit_cat_fact.message, phonenumber: @transmit_cat_fact.phonenumber, sentreceived: @transmit_cat_fact.sentreceived }
    end

    assert_redirected_to transmit_cat_fact_path(assigns(:transmit_cat_fact))
  end

  test "should show transmit_cat_fact" do
    get :show, id: @transmit_cat_fact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transmit_cat_fact
    assert_response :success
  end

  test "should update transmit_cat_fact" do
    put :update, id: @transmit_cat_fact, transmit_cat_fact: { message: @transmit_cat_fact.message, phonenumber: @transmit_cat_fact.phonenumber, sentreceived: @transmit_cat_fact.sentreceived }
    assert_redirected_to transmit_cat_fact_path(assigns(:transmit_cat_fact))
  end

  test "should destroy transmit_cat_fact" do
    assert_difference('TransmitCatFact.count', -1) do
      delete :destroy, id: @transmit_cat_fact
    end

    assert_redirected_to transmit_cat_facts_path
  end
end
