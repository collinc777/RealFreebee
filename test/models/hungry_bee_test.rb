require 'test_helper'

class HungryBeeTest < ActiveSupport::TestCase

  def setup
    @hungrybee = HungryBee.new(name: "Example User", email: "hungrybee@example.com",
                               password: "foobar", password_confirmation: "foobar",
                               phone_number: "7777777777")

  end

  test "should be valid" do
    assert @hungrybee.valid?
  end

  test "name should be present" do
    @hungrybee.name = ""
    assert_not @hungrybee.valid?
  end

  test "email should be present" do
    @hungrybee.email = "     "
    assert_not @hungrybee.valid?
  end

  test "name should not be too long" do
    @hungrybee.name = "a" * 51
    assert_not @hungrybee.valid?
  end

  test "email should not be too long" do
    @hungrybee.email = "a" * 256
    assert_not @hungrybee.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[hungrybee@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @hungrybee.email = valid_address
      assert @hungrybee.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[hungrybee@example,com hungrybee_at_foo.org hungrybee.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @hungrybee.email = invalid_address
      assert_not @hungrybee.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_hungrybee = @hungrybee.dup
    duplicate_hungrybee.email = @hungrybee.email.upcase
    @hungrybee.save
    assert_not duplicate_hungrybee.valid?
  end

  test "password should have a minimum length" do
    @hungrybee.password = @hungrybee.password_confirmation = "a" * 5
    assert_not @hungrybee.valid?
  end

  test "phone number should be present" do
    @hungrybee.phone_number = ""
    assert_not @hungrybee.valid?
  end

  test "phone number should be unique" do
    duplicate_hungrybee = @hungrybee.dup
    duplicate_hungrybee.phone_number = @hungrybee.phone_number
    @hungrybee.save
    assert_not duplicate_hungrybee.valid?
  end



end
