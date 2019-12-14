require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post with no values present" do
    post = Post.new
    post.save
    refute post.valid?
  end

  test "should save post with all correct values present" do
    assert Post.new(content: 'content', color: '#ffffff', text_color: '#ffffff', font_type: 'arial', font_size: '24', user_id: '1', group_id: '1').save
  end

  test "should not save post with no content, but all other values present" do
    assert_not Post.new(text_color: '#ffffff', font_type: 'arial', font_size: '24', user_id: '1', group_id: '1').save
  end

  test "should not save post with no group ID, but all other values present" do
    assert_not Post.new(content: 'content', text_color: '#ffffff', font_type: 'arial', font_size: '24', user_id: '1').save
  end

  test "should not save post with no user ID, but all other values present" do
    assert_not Post.new(content: 'content', text_color: '#ffffff', font_type: 'arial', font_size: '24', group_id: '1').save
  end

  test "should not save post with invalid text color, but all other values present and correct" do
    assert_not Post.new(content: 'content', text_color: 'blue', font_type: 'arial', font_size: '24', user_id: '1', group_id: '1').save
  end

  test "should not save post with invalid font type, but all other values present and correct" do
    assert_not Post.new(content: 'content', text_color: '#ffffff', font_type: '567', font_size: '24', user_id: '1', group_id: '1').save
  end

  test "should not save post with invalid font size, but all other values present and correct" do
    assert_not Post.new(content: 'content', text_color: '#ffffff', font_type: '567', font_size: '24s', user_id: '1', group_id: '1').save
  end

  test "should not save post with invalid color, but all other values present and correct" do
    assert_not Post.new(content: 'content', color: 'pink', text_color: '#ffffff', font_type: '567', font_size: '24s', user_id: '1', group_id: '1').save
  end
  
end
