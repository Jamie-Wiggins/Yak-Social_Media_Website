require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:user)
      @user2 = users(:user2)
      sign_in @user
      @group = groups(:group)
    end
  
    test "should get home" do
      get root_path
      assert_response :success
    end
  
    test "should get profile" do
        sign_in @user
        get ("/user/@user2.id")
        assert_response :success
    end

    # test "should get group" do
    #     get root_path
    #     assert_response :success
    # end

    # test "should get contact" do
    #     get root_path
    #     assert_response :success
    # end
end
