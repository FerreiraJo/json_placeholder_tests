# frozen_string_literal: true
require 'httparty'
require 'json-schema'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:all) do
    class HttParty
      include HTTParty
      base_uri 'https://jsonplaceholder.typicode.com/'
    end
    require_relative './fixtures/payloads/users/users'
  end

  RSpec::Matchers.define :match_response_schema do |schema|
    match do |response|
      schema_directory = "#{Dir.pwd}/spec/fixtures/schemas"
      schema_path = "#{schema_directory}/#{schema}.json"
      JSON::Validator.validate!(schema_path, response.body, strict: true)
    end
  end
end
