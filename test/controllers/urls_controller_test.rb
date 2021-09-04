require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_url_url
    assert_response :success
  end

  test "should redirect to index" do
    post urls_url, params: url_params
    assert_response :redirect
  end

  test "should render new" do
    post urls_url, params: url_params(original_url: "invalid url")
    assert_response :success
  end

  test "should redirect if id url is invalid" do
    get url_url('toto')
    assert_response :redirect
  end
end
