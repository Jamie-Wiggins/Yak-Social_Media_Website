require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user2)
    sign_in @user
    @group = groups(:grouptwo)
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should get edit" do
      get edit_group_url(@group)
      assert_response :success
  end
  
  # test "should create group" do
  #   sign_in @user
  #     assert_difference('Group.count') do
  #     post ('/groups'), params: {group: {name: @group.name, admin_id: @user.id}}
  #   end
  #   assert_redirected_to root_path
  # end

  test "should update group" do
    patch group_url(@group), params: { group: { name: @group.name, admin_id: @user.id} }
    assert_redirected_to root_path
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end
    assert_redirected_to root_path
  end
end