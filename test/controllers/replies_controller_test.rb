require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user)
    sign_in @user
    @post = posts(:post)
    @reply = replies(:replyone)
  end

  test "should create reply" do
    sign_in @user
      assert_difference('Reply.count') do
      post "/posts/"+@post.id.to_s+"/replies", params: {reply: {reply: "text", post_id: @post.id, user_id: @user.id }}
    end
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end

  test "should get edit" do
    get ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s+"/edit")
    assert_response :success
  end
 
  test "should update reply" do
    patch ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s), params: { reply: { reply: @reply.reply, post_id: @reply.post.id, user_id: @reply.user.id} }
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s)
    end
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end
end

