require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # failure case: should not save relationship
  test "should not save relationship with no content present" do
    relationship = Relationship.new
    relationship.save
    refute relationship.valid?
  end

   # success case: should save relation
   test "should save relation" do
    userOne = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    userOne.save
    userTwo = User.new(email: 'jamie@gamil.com', username: 'beniggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    userTwo.save
    relationship = Relationship.new(follower_id: userTwo.id, followed_id: userOne.id )
    assert relationship.save
  end

  # failure case: should not save when id's are the same
  test "should not save relationship if follwer and followed id's have the same value" do
    userOne = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    userOne.save
    relationship = Relationship.new(follower_id: userOne.id, followed_id: userOne.id )
    assert relationship.save
  end

  # failure case: should not save relationship with no follwer id
  test "should not save relationship if there is no follwer ID" do
    userOne = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    userOne.save
    relationship = Relationship.new(follower_id: "", followed_id: userOne.id )
    refute relationship.valid?
  end

  # failure case: should not save relationship with no follwed id
  test "should not save relationship if there is no follwed ID" do
    userOne = User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    userOne.save
    relationship = Relationship.new(follower_id: userOne.id, followed_id: "" )
    refute relationship.valid?
  end
end
