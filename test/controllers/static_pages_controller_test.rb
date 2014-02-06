require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about_game" do
    get :about_game
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should route to about_game" do
      assert_routing '/about_game', {action: "about_game", controller: "static_pages"}
  end

  test "should get about_company" do
    get :about_company
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should route to about_company" do
      assert_routing '/about_company', {action: "about_company", controller: "static_pages"}
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

  test "should route to contacts" do
      assert_routing '/contacts', {action: "contacts", controller: "static_pages"}
  end

  test "should get offer" do
    get :offer
    assert_response :success
  end

  test "should route to offer" do
      assert_routing '/offer', {action: "offer", controller: "static_pages"}
  end

  test "should get user_agreement" do
    get :user_agreement
    assert_response :success
  end

  test "should route to user_agreement" do
      assert_routing '/user_agreement', {action: "user_agreement", controller: "static_pages"}
  end

  test "should get security" do
    get :security
    assert_response :success
  end

  test "should route to security" do
      assert_routing '/security', {action: "security", controller: "static_pages"}
  end

  test "should get protection" do
    get :protection
    assert_response :success
  end

  test "should route to protection" do
      assert_routing '/protection', {action: "protection", controller: "static_pages"}
  end

end
