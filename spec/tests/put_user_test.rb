# frozen_string_literal: true

require 'httparty'


RSpec.describe 'Put User' do

  before(:each) do
    @payload = create_user
  end

  it 'Put an user and validate json reponse schema' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.put('/users/1', body: @payload.to_json, headers: headers)

    expect(response.code).to eql(200)
    expect(response).to match_response_schema('users/put_user')
  end

  it 'Put an non-existent user and validate reponse code' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.put('/users/0', body: @payload.to_json, headers: headers)

    expect(response.code).to eql(204)
  end
end
