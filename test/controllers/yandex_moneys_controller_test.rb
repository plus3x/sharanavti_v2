require 'test_helper'

class YandexMoneysControllerTest < ActionController::TestCase
  setup do
    @yandex_money = yandex_moneys(:one)
    @admin = 1
  end

  test "should get index" do
    login_as @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:yandex_moneys)
  end

  test "should get new" do
    login_as @admin
    get :new
    assert_response :success
  end

  test "should create yandex_money" do
    login_as @admin
    assert_difference('YandexMoney.count') do
      post :create, yandex_money: { customerid: @yandex_money.customerid, gems: @yandex_money.gems, invoiceid: @yandex_money.invoiceid, sum: @yandex_money.sum, user_id: @yandex_money.user_id }
    end

    assert_redirected_to yandex_money_path(assigns(:yandex_money))
  end

  test "should show yandex_money" do
    login_as @admin
    get :show, id: @yandex_money
    assert_response :success
  end

  test "should get edit" do
    login_as @admin
    get :edit, id: @yandex_money
    assert_response :success
  end

  test "should update yandex_money" do
    login_as @admin
    patch :update, id: @yandex_money, yandex_money: { customerid: @yandex_money.customerid, gems: @yandex_money.gems, invoiceid: @yandex_money.invoiceid, sum: @yandex_money.sum, user_id: @yandex_money.user_id }
    assert_redirected_to yandex_money_path(assigns(:yandex_money))
  end

  test "should destroy yandex_money" do
    login_as @admin
    assert_difference('YandexMoney.count', -1) do
      delete :destroy, id: @yandex_money
    end

    assert_redirected_to yandex_moneys_path
  end
end
