require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @client = 1
    @user = {email: 'user@g.com', password: 'secret'}
  end
  
  test "should get login" do
    get :new
    assert_select "#login_form" do
      assert_select "label", count: 2
      assert_select "input", count: 4
    end
  end

  test "should login" do
    post :create, email: @user[:email], password: @user[:password]
    assert_redirected_to root_url
  end
  
  test "should not login" do
    post :create, email: @user[:email], password: 'wrong'
    assert_redirected_to root_url
  end

  test "should logout" do
    login_as @client
    delete :destroy
    assert session[:user_id].nil?, 'Sessions must be empty!'
    assert_redirected_to root_url
  end
end
