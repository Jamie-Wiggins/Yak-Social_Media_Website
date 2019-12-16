require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # failure case: should not save relationship
  test "should not save relationship with no content present" do
    relationship = Relationship.new
    relationship.save
    refute relationship.valid?
  end

  # failure case: should not save when id's are the same
  test "should not save relationship if follwer and followed id's have the same value" do
    assert_not Relationship.new(follower_id: '2', followed_id: '2').save
  end

  # failure case: should not save relationship with no follwer id
  test "should not save relationship if there is no follwer ID" do
    assert_not Relationship.new(followed_id: '2').save
  end

  # failure case: should not save relationship with no follwed id
  test "should not save relationship if there is no follwed ID" do
    assert_not Relationship.new(follower_id: '2').save
  end
end
