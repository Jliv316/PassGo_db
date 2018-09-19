require 'rails_helper'

describe 'When I send a POST request to /api/v1/users/user_id/locations' do
  it 'returns a json response of 200 ok containing the user and all companies that users has points at' do
    ray = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")
    company = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)
    location = {location: {lat: 39.7514038, lng: -104.9975539}}
    token = "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1"

    post "/api/v1/users/#{token}/locations", params: location

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq("Ray")
    expect(json[:email]).to eq("Ray@ray.com")
    expect(json[:companies][0][:name]).to eq("Slice Works")
    expect(json[:companies][0][:points]).to eq(1)
    expect(json[:companies][0][:street]).to eq("1433 17th St")
    expect(json[:companies][0][:city]).to eq("Denver")
    expect(json[:companies][0][:state]).to eq("CO")
    expect(json[:companies][0][:zip_code]).to eq(80202)
    expect(json[:companies][0][:industry]).to eq("Pizza")
    expect(json[:companies][0][:latitude]).to eq(39.7514038)
    expect(json[:companies][0][:longitude]).to eq(-104.9975539)
  end
end

describe 'When I send a POST request to /api/v1/users/user_id/locations' do
  it 'returns a json response of 200 ok containing the user and all companies that users has points at and increments the points to 2' do
    ray = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")
    company = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)
    location = {location: {lat: 39.7514038, lng: -104.9975539}}
    token = "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1"

    post "/api/v1/users/#{token}/locations", params: location
    post "/api/v1/users/#{token}/locations", params: location

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq("Ray")
    expect(json[:email]).to eq("Ray@ray.com")
    expect(json[:companies][0][:name]).to eq("Slice Works")
    expect(json[:companies][0][:points]).to eq(2)
    expect(json[:companies][0][:street]).to eq("1433 17th St")
    expect(json[:companies][0][:city]).to eq("Denver")
    expect(json[:companies][0][:state]).to eq("CO")
    expect(json[:companies][0][:zip_code]).to eq(80202)
    expect(json[:companies][0][:industry]).to eq("Pizza")
    expect(json[:companies][0][:latitude]).to eq(39.7514038)
    expect(json[:companies][0][:longitude]).to eq(-104.9975539)
  end
end

describe 'When I send a POST request to /api/v1/users/user_id/locations' do
  it 'returns a json response of 200 ok, but does not add company to user companies' do
    ray = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")
    company = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza")
    location = {location: {lat: 39.7514038, lng: -104.9975539}}
    token = "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1"

    post "/api/v1/users/#{token}/locations", params: location

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq("Ray")
    expect(json[:email]).to eq("Ray@ray.com")
    expect(json[:companies]).to eq([])
  end
end


