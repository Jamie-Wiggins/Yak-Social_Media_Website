require 'test_helper'

class RelpyTest < ActiveSupport::TestCase
  test "should not save reply with no values present" do
    reply = Reply.new
    reply.save
    refute reply.valid?
  end
  
  test "should not save reply with not content but all other correct values present" do
    assert_not Reply.new(post_id: '1', user_id: '1').save
  end

  test "should not save reply with not user id, but all other correct values present" do
    assert_not Reply.new(reply: 'content', post_id: '1').save
  end

  test "should not save reply with not post id, but all other correct values present" do
    assert_not Reply.new(reply: 'content', user_id: '1').save
  end
end
