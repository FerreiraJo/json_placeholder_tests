# frozen_string_literal: true

require 'httparty'

RSpec.describe 'Get Users' do
  it 'Get all users and validate json schema' do
    response = HttParty.get('/users')
    expect(response.code).to eql(200)
    expect(response).to match_response_schema('users/get_users')
  end

  it 'Get an user by id and validate json schema' do
    response = HttParty.get('/users/1')
    expect(response.code).to eql(200)
    expect(response).to match_response_schema('users/get_user')
  end
end
