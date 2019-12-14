require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "new action should be success" do
    get :new
    assert_response :success
  end

  test "show action should be success" do
    post = fixtures(:hello_world)
    assert_response :success
  end
end
