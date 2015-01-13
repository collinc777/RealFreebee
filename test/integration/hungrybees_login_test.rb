require 'test_helper'

class HungrybeesLoginTest < ActionDispatch::IntegrationTest

  def setup
    @hungrybee = hungrybees(:collin)
  end

  test "login with invalid infromation" do
    get hungrybee_login_path
    assert_template 'sessions/new'
    post hungrybee_login_path, session: { phone_number: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get hungrybee_login_path
    post hungrybee_login_path, session: { phone_number: @hungrybee.phone_number,
                                          password: 'password'}
    assert is_logged_in?
    assert_redirected_to @hungrybee
    follow_redirect!
    assert_template 'hungrybees/show'
    delete hungrybee_logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete hungrybee_logout_path
    follow_redirect!
  end

  test "login with remembering" do
    log_in_as(@hungrybee, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without rememberting" do
    log_in_as(@hungrybee, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
