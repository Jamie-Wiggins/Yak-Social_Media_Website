require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # failure case: test should not save empty
  test "should not save empty group" do
    group = Group.new
    group.save
    refute group.valid?
  end

  # success case: should save valid group
  test "should save valid group" do
    group = Group.new
    group.name = "group"
    group.admin_id = 1

    group.save
    assert group.valid?
  end

  # success case: should save group without posts
  test "should save group without posts" do
    assert Group.new(name: 'group', admin_id: '1').save
  end

  # failure case: should not save with no admin id
  test "should not save group with no admin ID" do
    assert_not Group.new(name: 'group').save
  end

  # failure case: should not save with invalid name fomrat
  test "should not save group with numbers in the name" do
    assert_not Group.new(name: 'group1234', admin_id: '1').save
  end

  # failure case: should not save group name with space in it
  test "should not save group with spaces in the name" do
    assert_not Group.new(name: 'grou p', admin_id: '1').save
  end
end
