require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "should not save empty group" do
    group = Group.new
    group.save
    refute group.valid?
  end

  test "should save valid group" do
    group = Group.new
    group.name = "group"
    group.admin_id = 1
    group.post_id = 1

    group.save
    assert group.valid?
  end

  test "should save group with posts" do
    assert Group.new(name: 'group', post_id: '1', admin_id: '1').save
  end

  test "should save group without posts" do
    assert Group.new(name: 'group', admin_id: '1').save
  end

  test "should not save group with no admin ID" do
    assert_not Group.new(name: 'group').save
  end

  test "should not save group with numbers in the name" do
    assert_not Group.new(name: 'group1234', admin_id: '1').save
  end

  test "should not save group with spaces in the name" do
    assert_not Group.new(name: 'grou p', admin_id: '1').save
  end
  
end
