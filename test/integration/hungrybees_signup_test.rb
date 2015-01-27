require 'test_helper'

class HungrybeesSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get hungrybee_signup_path
    assert_no_difference 'Hungrybee.count' do
      post hungrybees_path, hungrybee: {name: "",
                                        phone_number: "invalid",
                                        password: "foo",
                                        password_confirmation: "bar"}
    end
    assert_template 'hungrybees/new'
  end

  test "valid signup information" do
    get hungrybee_signup_path
    assert_difference 'Hungrybee.count', 1 do
      post_via_redirect hungrybees_path, hungrybee: { name: "Example name",
                                                      phone_number: "7137777777",
                                                      password: "password",
                                                      password_confirmation: "password", is_registered?: true }
    end
    assert_template 'hungrybees/show'
    assert is_logged_in?
  end
end
