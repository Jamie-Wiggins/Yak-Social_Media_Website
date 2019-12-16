require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # failure case: should not save
  test "should not save user with no values present" do
    user = User.new
    user.save
    refute user.valid?
  end
  
  # success case: should save 
  test "should save user with all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    assert user.save
  end

  # failure case: should not save with an invalid email
  test "should not save user with an invalid email but all correct values present" do
    user = User.new
    user.email = "jgmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with an invalid username
  test "should not save user with an invalid username but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiew4 43iggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with an invalid first name
  test "should not save user with an invalid first name but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jam34534ie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with an invalid last name
  test "should not save user with an invalid last name but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggi  34652ns"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  test "should not save user with an invalid password but all correct values present" do
    user = User.new
    user.email = "jgmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "j"
    user.save
    refute user.valid?
  end

  # failure case: should not save with no email
  test "should not save user with no email present but all correct values present" do
    user = User.new
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with no username
  test "should not save user with no username present but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with no first name
  test "should not save user with no first name present but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.last_name = "wiggins"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with no last name
  test "should not save user with no last name present but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.password = "jamie1234"
    user.save
    refute user.valid?
  end

  # failure case: should not save with an password present
  test "should not save user with no password present but all correct values present" do
    user = User.new
    user.email = "j@gmail.com"
    user.username = "jamiewiggins"
    user.first_name = "jamie"
    user.last_name = "wiggins"
    user.save
    refute user.valid?
  end
end
