# frozen_string_literal: true

require 'httparty'
require 'faker'


RSpec.describe 'Delete User' do

  before(:each) do
    @payload = create_user

    # Create a user to ensure there is a user to be deleted
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.post('/users', body: @payload.to_json, headers: headers)
    @id = JSON.parse(response.body)['id']
  end

  it 'Delete an user and validate json reponse schema' do
    headers = { 'Content-Type' => 'application/json' }
    response = HttParty.delete("/users/#{@id}", headers: headers)

    expect(response.code).to eql(200)
    expect(response).to match_response_schema('/users/delete_user')
  end
end
