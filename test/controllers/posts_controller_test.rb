require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user)
    sign_in @user
    @group = groups(:group)
    @post = posts(:post)
  end
  
  test "new action should be success" do
    get root_path(Post.new)
    assert_response :success
  end

  test "should get search" do
    get ("/search"+"?q="+@post.content)
    assert_response :success
  end
  
  test "should create post" do
      assert_difference('Post.count') do
      post "/posts", params: {post: {content: @post.content, group_id: @post.group_id, user_id: @post.user_id}}
    end
    assert_redirected_to root_path
  end
 
  test "should edit post" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { name: @post.content} }
    assert_redirected_to root_path
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
  end
end
