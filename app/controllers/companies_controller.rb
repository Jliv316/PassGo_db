 class CompaniesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      @company = Company.new
    end

    def create
      company = Company.create(company_params)
      CoordService.new(company).latlng
      YelpPresenter.new(company).business
      binding.pry
      render json: company, status: 200
    end

    private
    def company_params
      params.require(:company).permit(:name, :street, :city, :state, :zip_code, :industry, :lat, :lng)
    end
  end