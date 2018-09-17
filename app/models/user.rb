class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies

  def points(company)
    UserCompany.where(user_id: id, company_id: company.id).first
  end

  def check_for_points(user, user_location, company)
    distance = Distance.new(company, user_location).distance
      if distance < 25
        UserCompany.create(user_id: user.id, company_id: company.id) if user.companies.find_by(id: company.id) == nil
        user_company = user.points(company)
        user_company.points += 1
        user_company.save
      end
  end
end