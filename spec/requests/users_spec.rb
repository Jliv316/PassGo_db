require 'rails_helper'

describe 'When I send a GET request to /api/v1/users' do
  it 'returns a json response of 200 ok containing all users' do
    ray = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")
    jimmy = User.create(name: "Jimmy Dean", email: "Jimmy@dean.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu2")

    get "/api/v1/users"
    

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[0][:name]).to eq("Ray")
    expect(json[0][:email]).to eq("Ray@ray.com")

    expect(json[1][:name]).to eq("Jimmy Dean")
    expect(json[1][:email]).to eq("Jimmy@dean.com")
  end
end

describe 'When I send a GET request to /api/v1/users/:id' do
  it 'returns a json response of 200 ok containing the user and its attributes (minus created_at and updated_at)' do
    ray = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")

    get "/api/v1/users/#{ray.token}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq(ray.name)
    expect(json[:email]).to eq(ray.email)
  end
end

describe 'When I send a POST request to /api/v1/users' do
  it 'returns a json response of 204 IF the company is successfully deleted' do
    ray = {user: {name: "ray", email: "ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1"}}

    post "/api/v1/users", params: ray

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(201)
    expect(json[:name]).to eq("ray")
    expect(json[:email]).to eq("ray@ray.com")
  end
end

