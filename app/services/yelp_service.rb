class YelpService
  attr_reader :latitude, :longitude, :street, :name

  def initialize(company)
    @latitude = company.lat
    @longitude = company.lng
    @street = company.street
    @name = company.name
  end

  def data
    return json = JSON.parse(response.body, symbolize_names: true)
  end
  

  def response
    conn = Faraday.new(:url => "https://api.yelp.com") do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&term=#{name}&location=#{street}"
      req.headers['Accept'] = "application/json"
      req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      req.headers['api_key'] = ENV['YELP_API_KEY']
      req.headers['client_id'] = ENV['YELP_CLIENT_ID']
    end
  end
end