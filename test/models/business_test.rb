require 'test_helper'

class BusinessTest < ActiveSupport::TestCase

  def setup
    @business = Business.new(name: "Example business", email: "business@example.com",
                          password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @business.valid?
  end

  test "name should be present" do
    @business.name = "     "
    assert_not @business.valid?
  end

  test "email shold be present" do
    @business.email = "      "
    assert_not @business.valid?
  end

  test "name should not be too long" do
    @business.name = "a" * 51
    assert_not @business.valid?
  end

  test "email should not be too long" do
    @business.email = "a" * 256
    assert_not @business.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[business@example.com business@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @business.email = valid_address
      assert @business.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[business@example,com business_at_foo.org business.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @business.email = invalid_address
      assert_not @business.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_business = @business.dup
    duplicate_business.email + @business.email.upcase
    @business.save
    assert_not duplicate_business.valid?
  end

  test "password should have a minimum length" do
    @business.password = @business.password_confirmation = "a" * 5
    assert_not @business.valid?
  end


end
