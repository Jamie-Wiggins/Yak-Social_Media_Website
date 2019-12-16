require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # set up post and reply and user which is then signed in
  setup do
    @user = users(:user)
    sign_in @user
    @post = posts(:post)
    @reply = replies(:replyone)
  end

  # success case: should create reply
  test "should create reply" do
    sign_in @user
      assert_difference('Reply.count') do
      post "/posts/"+@post.id.to_s+"/replies", params: {reply: {reply: "text", post_id: @post.id, user_id: @user.id }}
    end
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end

  # failure case: does not create reply when no valid reply text is entered
  test "should not create reply when no valid reply text" do
    sign_out @user
    assert_no_difference('Reply.count') do
      post "/posts/"+@post.id.to_s+"/replies", params: {reply: {reply: "", post_id: @post.id, user_id: @user.id }}
    end
  end

  # failure case: cannot create replpy when the user is not signed in
  test "should not create reply when no user signed in" do
    assert_no_difference('Reply.count') do
      post "/posts/"+@post.id.to_s+"/replies", params: {reply: {reply: "", post_id: @post.id, user_id: @user.id }}
    end
  end

  # success case: should get edit
  test "should get edit" do
    get ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s+"/edit")
    assert_response :success
  end
 
  # failure case: user cannot edit a replied unless signed in
  test "should not edit reply when no user signed in" do
    sign_out @user
    get ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s+"/edit")
    assert_redirected_to new_user_session_path
  end

  # success case: should update reply
  test "should update reply" do
    patch ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s), params: { reply: { reply: @reply.reply, post_id: @reply.post.id, user_id: @reply.user.id} }
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end

  # failure case: should not update reply if the user is not signed in 
  test "should not update reply if no user signed in" do
    sign_out @user
    patch ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s), params: { reply: { reply: @reply.reply, post_id: @reply.post.id, user_id: @reply.user.id} }
    assert_redirected_to new_user_session_path
  end

  # success case: should delete the reply if user signed in
  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s)
    end
    assert_redirected_to ("/posts/"+@post.id.to_s)
  end

  # failure case: cannot delete a reply unless a user is signed in
  test "should not delete reply if no user signed in" do
    sign_out @user
    assert_no_difference('Reply.count', -1) do
      delete ("/posts/"+@post.id.to_s+"/replies/"+@reply.id.to_s)
    end
  end
end

