require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paratskiy)
    @other_user = users(:archer)
  end

  test 'show as not-logged-in' do
    get users_path(@user)
    assert_redirected_to login_path
    follow_redirect!
    assert_select 'div.alert-danger'
  end

  test 'show non activated user' do
    log_in_as(@user)
    @other_user.toggle!(:activated)
    get user_path(@other_user)
    assert_redirected_to home_path
    follow_redirect!
  end
end
