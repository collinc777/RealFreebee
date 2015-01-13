

require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @hungrybee = hungrybees(:collin)
    remember(@hungrybee)
  end

  test "current_hungrybee returns right hungrybee when session is nil" do
    assert_equal @hungrybee, current_hungrybee
    assert is_logged_in?
  end

  test "current_hungrybee returns nil when remember digest is wrong" do
    @hungrybee.update_attribute(:remember_digest, Hungrybee.digest(Hungrybee.new_token))
    assert_nil current_hungrybee
  end
  
end