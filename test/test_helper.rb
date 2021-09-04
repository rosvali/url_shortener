ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def url_params(option = {})
    original_url = option[:original_url] || default_url
    { url: { original_url: original_url } }
  end

  def default_url
    "https://github.com/rosvali/url_shortener"
  end

  # Add more helper methods to be used by all tests here...
end
