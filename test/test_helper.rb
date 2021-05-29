ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class GraphQLError < StandardError
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers (causing problems on mac)
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def graphql_query(query_string, variables=nil)
    post graphql_path, params: { query: query_string, variables: variables }
    json_response = JSON.parse(@response.body)
    raise GraphQLError, json_response['errors'] if json_response.has_key? 'errors'
    json_response
  end
end
