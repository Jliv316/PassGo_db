class YelpPresenter
  attr_reader :company
  def initialize(company)
    @company = company
  end

  def businesses
    json = YelpService.new(company).data
    business_info = json[:businesses]
    businesses = business_info.map do |info|
      Business.new(info)
    end
    return businesses
  end

  def business
    json = YelpService.new(company).data
    business_info = json[:businesses][0]
    company.image_url = business_info[:image_url]
    company.save
  end
end