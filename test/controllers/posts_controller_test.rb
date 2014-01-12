require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @client = 1
    @admin  = 2
  end

  test "should get index" do
    login_as @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    login_as @admin
    get :new
    assert_response :success
  end

  test "should create post" do
    login_as @admin
    assert_difference('Post.count') do
      post :create, post: { description: @post.description, name: @post.name, picture_url: @post.picture_url }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    login_as @client
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    login_as @admin
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    login_as @admin
    patch :update, id: @post, post: { description: @post.description, name: @post.name, picture_url: @post.picture_url }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    login_as @admin
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
