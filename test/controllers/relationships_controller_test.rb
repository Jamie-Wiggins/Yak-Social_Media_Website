require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  # ?include Devise::Test::IntegrationHelpers

  # setup do
  #   @user = users(:user2)
  #   sign_in @user
  #   @user2 = users(:user)
  #   sign_in @user2
  #   @relationship = relationships(:relationship)
  # end

  # test "should create group" do
  #   sign_in @user
  #   sign_in @user2
  #     assert_difference('Relationship.count') do
  #     post ('/relatioships'), params: {relationship: {follower_id: @relationship.user, followed_id: @relationship.user2}}
  #   end
  #   assert_redirected_to root_path
  # end

  # test "should destroy group" do
  #   assert_difference('Group.count', -1) do
  #     delete group_url(@group)
  #   end
  #   assert_redirected_to root_path
  # end
end
