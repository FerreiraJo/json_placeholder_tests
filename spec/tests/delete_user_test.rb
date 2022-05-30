# frozen_string_literal: true

require 'httparty'
require 'faker'


RSpec.describe 'Delete User' do

  before(:each) do
    @payload = {
      name: Faker::Name.name,
      username: SecureRandom.alphanumeric(6),
      email: Faker::Internet.email,
      address: {
        street: Faker::Address.street_name,
        suite: 'unknown',
        city: Faker::Address.city,
        zipcode: Faker::Address.postcode,
        geo: {
          lat: Faker::Address.latitude,
          lng: Faker::Address.longitude,
        }
      },
      phone: Faker::PhoneNumber.phone_number,
      website: Faker::Internet.url,
      company: {
        name: Faker::Company.name,
        catchPhrase: Faker::Company.catch_phrase,
        bs: Faker::Company.bs
      }
    }

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
