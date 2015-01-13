require 'test_helper'

class HungrybeeTest < ActiveSupport::TestCase
  def setup
    @hungrybee = Hungrybee.new(name: "follin", phone_number: "7136667666",
                                password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @hungrybee.valid?
  end

  test "name should be present" do
    @hungrybee.name = ""
    assert_not @hungrybee.valid?
  end

  test "name should be less than 56 characters" do
    @hungrybee.name = "a" * 56
    assert_not @hungrybee.valid?
  end

  #tests for phone numbers

  test "phone number should be present" do
    @hungrybee.phone_number = ""
    assert_not @hungrybee.valid?
  end

  test "phone number should be all numbers" do
    @hungrybee.phone_number = "adb5115987"
    assert_not @hungrybee.valid?
  end

  test "phone number should be 10 characters" do
    @hungrybee.phone_number = "17136675645"
    assert_not @hungrybee.valid?
  end

  test "phone number should be unique" do
    duplicate_hb = @hungrybee.dup
    duplicate_hb.phone_number = @hungrybee.phone_number
    @hungrybee.save
    assert_not duplicate_hb.valid?
  end

  #test for passwords
  test "password should have a minimum length" do
    @hungrybee.password = @hungrybee.password_confirmation = "a" * 5
    assert_not @hungrybee.valid?
  end

  test "authenticated? should return false for a hungrybee with nil digest" do
    assert_not @hungrybee.authenticated?('')
  end

end
