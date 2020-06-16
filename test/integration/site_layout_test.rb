require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paratskiy)
  end

  test 'layout links' do
    get home_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', home_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path
    log_in_as(@user)
    get user_path(@user)
    assert_select 'a[href=?]', users_path
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', edit_user_path(@user)
    assert_select 'a[href=?]', logout_path
  end
end
