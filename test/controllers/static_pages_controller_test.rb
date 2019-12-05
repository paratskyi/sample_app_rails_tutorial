require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get home_url
    assert_response :success
    assert_select 'title', full_title()
  end

  test 'should get help' do
    get help_url
    assert_response :success
    assert_select 'title', full_title('Help')
  end

  test 'should get about' do
    get about_url
    assert_response :success
    assert_select 'title', full_title('About')
  end

  test 'should get contact' do
    get contact_url
    assert_response :success
    assert_select 'title', full_title('Contact')
  end
  
  test 'should get sign up' do
    get signup_url
    assert_response :success
    assert_select 'title', full_title('Sign up')
  end
end
