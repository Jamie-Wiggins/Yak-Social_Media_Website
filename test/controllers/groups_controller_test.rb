require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # set up groups with an image assets and a user which gets signed in 
  setup do
    @user = users(:user2)
    sign_in @user
    @group = groups(:groupthree)
    @group_image = fixture_file_upload('test/fixtures/files/banner.jpg', 'image/jpg')
  end

  # success case: gets the new group url
  test "should get new group" do
    get new_group_url
    assert_response :success
  end

  # failure case: a user who is not logged in cannot create a new group
  test "should not get new when no user signed in" do
    sign_out @user
    get new_group_url
    assert_redirected_to new_user_session_path
  end

  # success case: gets the edit url for a group
  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  # faliure case: a user who is not logged in cannot edit a group
  test "should not get edit when no user signed in" do
    sign_out @user
    get edit_group_url(@group)
    assert_redirected_to new_user_session_path
  end

  # success case: a logged in user can create a group
  test "should create group" do
      assert_difference('Group.count') do
      post "/groups", params: {group: {name: "kahflkdg", admin_id: @user.id, post_id: @group.post_id, image: @group_image}}
    end
    assert_redirected_to root_path
  end

  # failure case: a logged in user can not create a group if there is no name entered
  test "should not create group if invalid name is entered" do
    post "/groups", params: {group: {name: "", admin_id: @user_id, post_id: @group.post_id}}
    assert_response :success
  end

  # failure case: a user that is not logged in cannot create a group
  test "should not create group if no user signed in" do
    sign_out @user
    post ('/groups'), params: {group: {name: @group.name, admin_id: @user_id, post_id: @group.post_id}}
    assert_redirected_to new_user_session_path
  end

  # success case: a logged in user can update a group
  test "should update group" do
    patch group_url(@group), params: { group: { name: @group.name, admin_id: @user.id} }
    assert_redirected_to root_path
  end

  # failure case: a logged in user can not update a group without a valid name
  test "should not update group if invalid name is entered" do
    patch group_url(@group), params: { group: {name: ""} }
    assert_response :success
  end

  # success case: a logged in user can destroy a group if they are the admin 
  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end
    assert_redirected_to root_path
  end

  # failure case: a user that is not logged in cannot delete a group
  test "should not delete group if no user signed in" do
    sign_out @user
    assert_no_difference('Group.count', -1) do
      delete group_url(@group)
    end
  end
end