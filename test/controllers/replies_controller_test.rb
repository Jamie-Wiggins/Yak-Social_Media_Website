require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @user = users(:user)
  #   sign_in @user
  #   @post = posts(:post)
  # end

  # test "should get new" do
  #   get new_reply_url
  #   assert_response :success
  # end

  # test "should create reply" do
  #   sign_in @user
  #     assert_difference('Reply.count') do
  #     post "/posts/1/", params: {reply: {reply: "text", post_id: @post.id, user_id: @user.id }}
  #   end
  #   assert_redirected_to root_path
  # end

  # test "should get edit" do
  #   get edit_group_url(@group)
  #   assert_response :success
  # end

  # test "should update group" do
  #   patch group_url(@group), params: { group: { name: @group.name, admin_id: @user.id} }
  #   assert_redirected_to root_path
  # end

  # test "should destroy group" do
  #   assert_difference('Group.count', -1) do
  #     delete group_url(@group)
  #   end
  #   assert_redirected_to root_path
  # end
end

