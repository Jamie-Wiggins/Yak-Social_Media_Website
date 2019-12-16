require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  
  # success case: returns a contact email
  test "should return contact email" do
    mail = ContactMailer.contact_email("info@yak.com", "jamie wiggins", @message = "Hello")
    
    assert_equal ['info@yak.com'], mail.to
    assert_equal ['info@yak.com'], mail.from
  end

  # fail case: should fail invalid email to
  test "should fail invalid email to" do
    mail = ContactMailer.contact_email("info@yak.com", "jamie wiggins", @message = "Hello")
    
    assert_not_equal ['infoyak.com'], mail.to
    assert_equal ['info@yak.com'], mail.from
  end

  # fail case: should fail invalid email from
  test "should fail invalid email from" do
    mail = ContactMailer.contact_email("info@yak.com", "jamie wiggins", @message = "Hello")
    
    assert_equal ['info@yak.com'], mail.to
    assert_not_equal ['infoyak.com'], mail.from
  end
end
