class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :companies

  def companies
    user_companies = []
    object.companies.each do |company|
      hash = {}
      hash[:name] = company.name
      hash[:points] = object.points(company).points
      hash[:street] = company.street
      hash[:city] = company.city
      hash[:state] = company.state
      hash[:zip_code] = company.zip_code
      hash[:industry] = company.industry
      hash[:latitude] = company.lat
      hash[:longitude] = company.lng
      user_companies << hash
    end
    return user_companies
  end
end
