# frozen_string_literal: true

require 'httparty'
require 'faker'


RSpec.describe 'Post User' do

  before(:each) do
    @payload = create_user
    @invalid_paylod = create_invalid_payload
  end

  it 'Post an user and validate json reponse schema' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.post('/users', body: @payload.to_json, headers: headers)

    expect(response.code).to eql(201)
    expect(response).to match_response_schema('users/post_user')
  end

  it 'Post an user with invalid json schema' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.post('/users', body: @invalid_paylod.to_json, headers: headers)

    expect(response.code).to eql(422)
    expect(response).to match_response_schema('users/post_user')
  end
end
