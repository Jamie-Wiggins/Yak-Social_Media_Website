require 'test_helper'

class RelpyTest < ActiveSupport::TestCase
  # failure case: should not save
  test "should not save reply with no values present" do
    reply = Reply.new
    reply.save
    refute reply.valid?
  end
  
  # success case: should save reply
  test "should save reply" do
    reply = Reply.new(reply: "content")
    post = Post.new(content: "more content")

    reply.post = post
    reply.user = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    assert reply.save
  end

  # failure case: should not save with no content
  test "should not save reply with no content but all other correct values present" do
    reply = Reply.new(reply: "")
    post = Post.new(content: "more content")

    reply.post = post
    reply.user = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    refute reply.valid?
  end

  # failure case: should not save with no user id
  test "should not save reply with no user id, but all other correct values present" do
    reply = Reply.new(reply: "content")
    post = Post.new(content: "more content")

    reply.post = post
    refute reply.valid?
  end

  # failure case: should not save with no post id
  test "should not save reply with no post id, but all other correct values present" do
    reply = Reply.new(reply: "content")
    post = Post.new(content: "more content")

    reply.user = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    refute reply.valid?
  end
end
