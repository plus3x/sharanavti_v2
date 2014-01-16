require 'test_helper'

class YandexMoneyControllerTest < ActionController::TestCase
  setup do
    @client_order = yandex_moneys(:one)
  end
  
  test "should check order" do
    post :check_order#, @client_order
    assert_response :success
  end

  test "should set payment done" do
    post :payment_done#, @client_order
    assert_response :success
  end
end
