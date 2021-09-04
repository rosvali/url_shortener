require "test_helper"

class UrlTest < ActiveSupport::TestCase
  test "should create an url with a valid original url" do
    url = Url.create(original_url: "https://github.com/rosvali/url_shortener")
    refute url.nil?
  end
end
