class CoordService
  attr_reader :company

  def initialize(company)
    @company = company
  end

  def formatAddress
    street = @company.street.gsub(" ", "+")
    city = @company.city.gsub(" ", "+")
    state = @company.state
    return address = "#{street},+#{city},+#{state}"
  end

  def latlng
    binding.pry
    latitude = data[:results][0][:geometry][:location][:lat]
    longitude = data[:results][0][:geometry][:location][:lng]
    @company.lat = latitude
    @company.lng = longitude
    @company.save
  end

  private
  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json")
  end

  def response
    address = formatAddress
    conn.get "?address=#{address}&key=#{ENV['GOOGLE_API_KEY']}" do |request|

    end
  end
  
  def data
    json = JSON.parse(response.body, symbolize_names: true)
  end
end