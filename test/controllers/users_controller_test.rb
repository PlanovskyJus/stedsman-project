require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
  get signup_path
  assert_difference 'User.count', 1 do
    post users_path, params: { user: { name:  "Example User",
                                       email: "user@example.com",
                                       password:              "password",
                                       password_confirmation: "password" } }
  end
  follow_redirect!
  assert_template 'users/show'
end

  test "should redirect edit when not logged in" do
      get edit_user_path(@user)
      assert_not flash.empty?
      assert_redirected_to login_url
    end

    test "should redirect update when not logged in" do
      patch user_path(@user), params: { user: { name: @user.name,
                                                email: @user.email } }
      assert_not flash.empty?
      assert_redirected_to login_url
    end
    
    test "should not allow the admin attribute to be edited via the web" do
      log_in_as(@other_user)
      assert_not @other_user.admin?
      patch user_path(@other_user), params: {
                                      user: { password:              FILL_IN,
                                              password_confirmation: FILL_IN,
                                              admin: FILL_IN } }
      assert_not @other_user.FILL_IN.admin?
    end

end
