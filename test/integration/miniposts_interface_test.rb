require 'test_helper'

class MinipostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paratskiy)
  end

  test 'minipost interface' do
    log_in_as(@user)
    get home_path
    assert_select 'div.pagination'
    assert_select 'input#minipost_picture'
    assert_no_difference 'Minipost.count' do
      post miniposts_path, params: { minipost: { content: '' } }
    end
    assert_select 'div#error_explanation'

    content = 'This minipost really ties the room together'
    picture = fixture_file_upload('test/fixtures/test.jpg', 'image/jpg')
    assert_difference 'Minipost.count', 1 do
      post miniposts_path, params: { minipost: { content: content,
                                                 picture: picture } }
    end
    assert @user.miniposts.first.picture?
    assert_redirected_to home_path
    follow_redirect!
    assert_match content, response.body

    assert_select 'a', text: 'delete'
    first_minipost = @user.miniposts.paginate(page: 1).first
    assert_difference 'Minipost.count', -1 do
      delete minipost_path(first_minipost)
    end

    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

  test 'minipost sidebar count' do
    log_in_as(@user)
    get home_path
    assert_match "#{@user.miniposts.count} miniposts", response.body
    other_user = users(:malory)
    log_in_as(other_user)
    get home_path
    assert_match '0 miniposts', response.body
    other_user.miniposts.create!(content: 'A minipost')
    get home_path
    assert_match "#{other_user.miniposts.count} minipost", response.body
  end
end
