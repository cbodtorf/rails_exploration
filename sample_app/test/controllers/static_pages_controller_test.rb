require 'test_helper'

# assert_select method, which lets us test for the presence of a particular HTML tag
# (sometimes called a “selector”, hence the name)

# setup is run before each test.
def setup
  @base_title = "Ruby on Rails Tutorial Sample App"
end

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
