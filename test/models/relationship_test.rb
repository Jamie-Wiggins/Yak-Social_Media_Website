require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  test "should not save relationship with no content present" do
    relationship = Relationship.new
    relationship.save
    refute relationship.valid?
  end

  test "should not save relationship if follwer and followed id's have the same value" do
    assert_not Relationship.new(follower_id: '2', followed_id: '2').save
  end

  test "should not save relationship if there is no follwer ID" do
    assert_not Relationship.new(followed_id: '2').save
  end

  test "should not save relationship if there is no follwed ID" do
    assert_not Relationship.new(follower_id: '2').save
  end
end
