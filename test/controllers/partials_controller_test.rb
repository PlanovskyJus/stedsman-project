require 'test_helper'

class PartialsControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get partials_signin_url
    assert_response :success
  end

  test "should get signout" do
    get partials_signout_url
    assert_response :success
  end

end
