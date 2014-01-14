require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should get new" do
    user = User.new
    assert  user, 'API must return new user'
  end  
  
  test "should find user by id" do
    user = User.find(1)
    assert user, 'API must find user by id'
  end
  
  test "should find user by email" do
    user = User.find_by_email('vasya@mail.com')
    assert user, 'API must find user by email'
  end
  
  test "should not find user by email" do
    user = User.find_by_email('wrong@mail.com')
    refute user, 'API must not find user by email'
  end
end
