require 'test_helper'

class HungrybeeTest < ActiveSupport::TestCase
  def setup
    @hungrybee1 = Hungrybee.new(name: "follin", phone_number: "7136667666",
                                password: "foobar", password_confirmation: "foobar", is_registered?: true)
    @hungrybee2 = Hungrybee.new(name: "", phone_number: "5126666666", password: "", password: "", is_registered?: false)
  end

  test "hungrybee should be valid" do
    assert @hungrybee1.valid?
  end


  test "name should be less than 56 characters" do
    @hungrybee1.name = "a" * 56
    assert_not @hungrybee1.valid?
  end

  #tests for phone numbers

  test "phone number should be present" do
    @hungrybee1.phone_number = ""
    assert_not @hungrybee1.valid?
  end

  test "phone number should be all numbers" do
    @hungrybee1.phone_number = "adb5115987"
    assert_not @hungrybee1.valid?
  end

  test "phone number should be 10 characters" do
    @hungrybee1.phone_number = "17136675645"
    assert_not @hungrybee1.valid?
  end

  test "phone number should be unique" do
    duplicate_hb = @hungrybee1.dup
    duplicate_hb.phone_number = @hungrybee1.phone_number
    @hungrybee1.save
    assert_not duplicate_hb.valid?
  end

  #test for passwords
  test "password should have a minimum length" do
    @hungrybee1.password = @hungrybee1.password_confirmation = "a" * 5
    assert_not @hungrybee1.valid?
  end

  test "authenticated? should return false for a hungrybee with nil digest" do
    assert_not @hungrybee1.authenticated?('')
  end


  test "hungrybee name not required if checked in but not registered" do
    assert @hungrybee2.valid?
  end

end
