
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups

end


def sign_up
  visit new_user_url
  fill_in "Username", with: "Superman"
  fill_in "Password", with: "Clark Kent"
  click_on "Sign Up"
end

def sign_in
  sign_up
  visit new_session_url
  fill_in "Username", with: "Superman"
  fill_in "Password", with: "Clark Kent"
  click_on "Sign In"
end
