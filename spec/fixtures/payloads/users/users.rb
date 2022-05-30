require 'faker'

def create_user
  {
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
end

def create_invalid_payload
  {
    names: Faker::Name.name,
    usernames: SecureRandom.alphanumeric(6),
    emails: Faker::Internet.email,
    address: {
      street: Faker::Address.street_name,
      suite: 'unknown',
      city: Faker::Address.city,
      zipcodes: Faker::Address.postcode,
      geo: {
        lat: Faker::Address.latitude,
        lng: Faker::Address.longitude,
      }
    },
    phone_number: Faker::PhoneNumber.phone_number,
    url: Faker::Internet.url
  }
end
