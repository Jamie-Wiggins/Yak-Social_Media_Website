require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user with no values present" do
    user = User.new
    user.save
    refute user.valid?
  end
  
  test "should save user with all correct values present" do
    assert User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with an invalid email but all correct values present" do
    assert_not User.new(email: 'jgamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with an invalid username but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'j', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with an invalid first name but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie5', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with an invalid last name but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'w5iggins', password: 'jamie1234').save
  end

  test "should not save user with an invalid password but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamieadmin').save
  end

  test "should not save user with no email present but all correct values present" do
    assert_not User.new(username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with no username present but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with no first name present but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', last_name: 'wiggins', password: 'jamie1234').save
  end

  test "should not save user with no last name present but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', password: 'jamie1234').save
  end

  test "should not save user with no password present but all correct values present" do
    assert_not User.new(email: 'j@gamil.com', username: 'jamiewiggins', first_name: 'jamie', last_name: 'wiggins').save
  end
end
