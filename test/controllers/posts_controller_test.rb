require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # sets up group, post, user and signs in the user 
  setup do
    @user = users(:user)
    sign_in @user
    @group = groups(:group)
    @post = posts(:post)
  end
  
  # success case: should get the new post url
  test "new action should be success" do
    get root_path(Post.new)
    assert_response :success
  end

  # success case: should get search 
  test "should get search" do
    get ("/search"+"?q="+@post.content)
    assert_response :success
  end
  
  # success case: should create post when user is signed in
  test "should create post" do
      assert_difference('Post.count') do
      post "/posts", params: {post: {content: @post.content, group_id: @post.group_id, user_id: @post.user_id}}
    end
    assert_redirected_to root_path
  end

  # failure case: should no create post when no user is logged in 
  test "should not create post when no user signed in" do
    sign_out @user
    assert_no_difference('Post.count') do
      post "/posts", params: {post: {content: @post.content, group_id: @post.group_id, user_id: @post.user_id}}
    end
  end
 
  # success case: should get the edit post
  test "should edit post" do
    get edit_post_url(@post)
    assert_response :success
  end

  # failure case: when user is no signed in they cannot edit a post
  test "should not edit post" do
    sign_out @user
    get edit_post_url(@post)
    assert_redirected_to new_user_session_path
  end

  # success case: should update post while user is logged in 
  test "should update post" do
    patch post_url(@post), params: { post: { content: @post.content} }
    assert_redirected_to root_path
  end

  # failure case: should not update the post if no content is enter (null)
  test "should not update post if no content is entered" do
    sign_out @user
    patch post_url(@post), params: { post: { content: @post.content} }
    assert_redirected_to new_user_session_path
  end

  # sucess case: when a user is signed in they can delete a post
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
  end

  # failure case: when no user is logged in, a post cannot be deleted
  test "should not delete post if no user signed in" do
    sign_out @user
    assert_no_difference('Post.count', -1) do
      delete post_url(@post)
    end
  end
end
