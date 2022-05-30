# frozen_string_literal: true

require 'httparty'
require 'faker'


RSpec.describe 'Post User' do

  before(:each) do
    @payload = create_user
  end

  it 'Post an user and validate json reponse schema' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.post('/users', body: @payload.to_json, headers: headers)

    expect(response.code).to eql(201)
    expect(response).to match_response_schema('users/post_user')
  end
end
