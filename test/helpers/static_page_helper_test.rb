require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @default_title = 'Ruby on Rails Tutorial Sample App'
  end
  test 'full title helper' do
    assert_equal full_title, @default_title
    assert_equal full_title('About'), "About | #{@default_title}"
  end
end
