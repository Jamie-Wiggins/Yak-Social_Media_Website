require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # failure case: should not save post with no value present
  test "should not save post with no values present" do
    post = Post.new
    post.save
    refute post.valid?
  end

  # success case: should save post with all values present
  test "should save valid post" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = "content"
    post.text_color = "#ffffff"
    post.font_type = "arial"
    post.font_size = "24"

    post.user = user
    post.group = group
    assert post.save
  end
  
  # failure case: should not save post with no content
  test "should not save post with no content, but all other values present" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = ""
    post.text_color = "#ffffff"
    post.font_type = "arial"
    post.font_size = "24"

    post.user = user
    post.group = group
    refute post.valid?
  end

  # failure case: should not save post with no user id
  test "should not save post with no user id, but all other values present" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = ""
    post.text_color = "#ffffff"
    post.font_type = "arial"
    post.font_size = "24"

    post.group = group
    refute post.valid?
  end

   # failure case: should not save post with no group id
   test "should not save post with no group id, but all other values present" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = ""
    post.text_color = "#ffffff"
    post.font_type = "arial"
    post.font_size = "24"

    post.user = user
    refute post.valid?
  end

  # failure case: should not save post with invalid text color
  test "should not save post with invalid text color, but all other values present and correct" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = "content"
    post.text_color = "#fff456ff"
    post.font_type = "arial"
    post.font_size = "24"

    post.user = user
    post.group = group
    refute post.valid?
  end
  
  # failure case: should not save post with invalid font size
  test "should not save post with no font size, but all other values present and correct" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = "content"
    post.text_color = "#ffffff"
    post.font_type = "arial"

    post.user = user
    post.group = group
    refute post.valid?
  end

  # failure case: should not save post with invalid color
  test "should not save post with invalid color, but all other values present and correct" do
    user = User.new(email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    group = Group.new(name: "jamiechat", admin_id: user.id)
    group.save
    post = Post.new
    post.content = "content"
    post.color = ""
    post.text_color = "#ffffff"
    post.font_type = "arial"
    post.font_size = "24"

    post.user = user
    post.group = group
    refute post.valid?
  end
end
