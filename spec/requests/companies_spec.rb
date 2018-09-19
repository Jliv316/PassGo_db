require 'rails_helper'

describe 'When I send a GET request to /api/v1/companies' do
  it 'returns a json response of 200 ok containing all companies' do
    sliceWorks = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)
    Turing = Company.create(name: "Turing: School of Software and Design", street: "1331 17th St", city: "Denver", state: "CO", zip_code: 80202, lat: 39.7507834, lng: -104.9964355)

    get "/api/v1/companies"
    

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[0][:name]).to eq("Slice Works")
    expect(json[0][:street]).to eq("1433 17th St")
    expect(json[0][:city]).to eq("Denver")
    expect(json[0][:state]).to eq("CO")
    expect(json[0][:zip_code]).to eq(80202)
    expect(json[0][:lat]).to eq(39.7514038)
    expect(json[0][:lng]).to eq(-104.9975539)

    expect(json[1][:name]).to eq("Turing: School of Software and Design")
    expect(json[1][:street]).to eq("1331 17th St")
    expect(json[1][:city]).to eq("Denver")
    expect(json[1][:state]).to eq("CO")
    expect(json[1][:zip_code]).to eq(80202)
    expect(json[1][:lat]).to eq(39.7507834)
    expect(json[1][:lng]).to eq(-104.9964355)
  end
end

describe 'When I send a GET request to /api/v1/companies/:id' do
  it 'returns a json response of 200 ok containing the company and its attributes (minus created_at and updated_at)' do
    sliceWorks = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)

    get "/api/v1/companies/#{sliceWorks.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq("Slice Works")
    expect(json[:street]).to eq("1433 17th St")
    expect(json[:city]).to eq("Denver")
    expect(json[:state]).to eq("CO")
    expect(json[:zip_code]).to eq(80202)
    expect(json[:lat]).to eq(39.7514038)
    expect(json[:lng]).to eq(-104.9975539)
  end
end

describe 'When I send a DELETE request to /api/v1/companies/:id' do
  it 'returns a json response of 204 IF the company is successfully deleted' do
    sliceWorks = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)

    delete "/api/v1/companies/#{sliceWorks.id}"

    expect(response).to have_http_status(204)
  end
end

