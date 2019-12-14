require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "new action should be success" do
  #   get :new
  #   assert_response :success
  # end

  setup do
    @user = users(:user)
    sign_in @user
    @group = groups(:group)
    @post = posts(:post)
  end

  test "should get search" do
    get search_path
    assert_response :success
  end

  test "should get new" do
    get root_path
    assert_response :success
  end

  test "should create post" do
      post "/groups", params: {group: {name: "jamie", admin_id: @user.id, id: 1}}
      assert_difference('Post.count') do
      post "/posts", params: {post: {content: "hi", user_id: @user.id, group_id: 1}}
    end
    assert_redirected_to root_path
  end

  test "should update post" do
    assert_difference('Post.count', -1) do
      delete "/posts/1"
    end
  end

  test "should edit post" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete "/posts/1"
    end
  end


  

  # test "show action should be success" do
  #   post = posts(:post)

  #   get :show
  #   assert_response :success
  # end
end
