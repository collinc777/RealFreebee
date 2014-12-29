require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  #to add a page first lets test its creation
=begin
  test "should get help" do
    get :help
    assert_response :success
  end
=end

end
