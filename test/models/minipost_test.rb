require 'test_helper'

class MinipostTest < ActiveSupport::TestCase
  def setup
    @user = users(:paratskiy)
    @minipost = @user.miniposts.build(content: 'Lorem ipsum')
  end

  test 'should be valid' do
    assert @minipost.valid?
  end

  test 'user id should be present' do
    @minipost.user_id = nil
    assert_not @minipost.valid?
  end

  test 'content should be present' do
    @minipost.content = '   '
    assert_not @minipost.valid?
  end

  test 'content should be at most 140 characters' do
    @minipost.content = 'a' * 141
    assert_not @minipost.valid?
  end

  test 'order should be most recent first' do
    assert_equal miniposts(:most_recent), Minipost.first
  end
end
