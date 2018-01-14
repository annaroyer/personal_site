require './test/test_helper'

class AboutTest < CapybaraTestCase
  def test_user_can_see_about_me_page
    visit '/about'

    save_and_open_page
    assert page.has_content?('About Me!')
    assert_equal 200, page.status_code
  end
end
