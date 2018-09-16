module Api::V1
  class CompaniesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      # company = Company.create(company_params)
      company = Company.first
      CoordService.new(company).latlng
      YelpPresenter.new(company).business
      render json: company, status: 200
    end

    private
    def company_params
      params.require(:company).permit(:name, :street, :city, :state, :zip_code, :industry, :lat, :lng)
    end
  end
end