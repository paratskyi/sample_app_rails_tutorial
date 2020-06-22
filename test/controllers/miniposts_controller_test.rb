require 'test_helper'

class MinipostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @minipost = miniposts(:orange)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Minipost.count' do
      post miniposts_path, params: { minipost: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Minipost.count' do
      delete minipost_path(@minipost)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong minipost' do
    log_in_as(users(:paratskiy))
    minipost = miniposts(:ants)
    assert_no_difference 'Minipost.count' do
      delete minipost_path(minipost)
    end
    assert_redirected_to home_path
  end
end
