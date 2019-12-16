require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:user)
      @user2 = users(:user2)
      @group = groups(:groupthree)
      @group_image = fixture_file_upload('test/fixtures/files/banner.jpg', 'image/jpg')
    end
  
    test "should get home" do
      get root_path
      assert_response :success

      assert_template layout: 'application'
        assert_template 'posts/_post'
        assert_template 'shared/_group'
        assert_template 'pages/home'
        assert_template 'shared/_alert'
        assert_template 'shared/_header'
        assert_template 'shared/_footer' 
    end
  
    test "should get profile" do
        sign_in @user
        get ("/user/"+@user.username)
        assert_response :success

        assert_template layout: 'application'
          assert_template 'shared/_relation' 
          assert_template 'posts/_post' 
          assert_template 'shared/_group' 
          assert_template 'pages/profile' 
          assert_template 'shared/_alert' 
          assert_template 'shared/_header' 
          assert_template 'shared/_footer' 
    end

    test "should not get profile when no user signed in" do
      get ("/user/"+@user.username)
      assert_redirected_to new_user_session_url
    end

    test "should post request contact but no email" do
      post request_contact_url
      assert_response :redirect
      assert_not_empty flash[:alert]
      assert_nil flash[:notice]
    end

    test "should get group" do 
      sign_in @user  
      post ('/groups'), params: {group: {name: @group.name, admin_id: @user_id, image: @group_image}} do 
      get ("/group/"+@group.name) 
    end
      assert_response :success

      assert_template layout: 'application'
        assert_template 'groups/_form'
        assert_template 'groups/new'
        assert_template 'shared/_alert'
        assert_template 'shared/_header'
        assert_template 'shared/_footer'
    end

    test "should not get group when no user signed in" do
      get ("/group/"+@group.name) 
      assert_redirected_to new_user_session_url
    end

    test "should get contact" do
      sign_in @user
      get ("/contact")
      assert_response :success
    
      assert_template layout: 'application'
        assert_template 'pages/contact'
        assert_template 'shared/_alert'
        assert_template 'shared/_header'
        assert_template 'shared/_footer'
    end

    test "should not get contact unless user is signed in" do
      get ("/contact")
      assert_redirected_to new_user_session_url
    end
end
