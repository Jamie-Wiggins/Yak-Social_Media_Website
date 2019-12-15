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

  # test "should get search" do
  #   get search_path
  #   assert_response :success
  # end

  # test "should get new" do
  #   get root_path
  #   assert_response :success
  # end

  test "should create post" do
      assert_difference('Post.count') do
      post "/posts", params: {post: {content: @post.content, group_id: @post.group_id, user_id: @post.user_id}}
    end
    assert_redirected_to root_path
  end

  # test "should update post" do
  #   assert_difference('Post.count', -1) do
  #     delete "/posts/1"
  #   end
  # end

  # test "should edit post" do
  #   get edit_post_url(@post)
  #   assert_response :success
  # end

  # test "should destroy post" do
  #   assert_difference('Post.count', -1) do
  #     delete "/posts/1"
  #   end
  # end


  

  # test "show action should be success" do
  #   post = posts(:post)

  #   get :show
  #   assert_response :success
  # end
end
