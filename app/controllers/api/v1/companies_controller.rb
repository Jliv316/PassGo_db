module Api::V1
  class CompaniesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      company = Company.create(company_params)
      CoordService.new(company).latlng
      YelpPresenter.new(company).business
      render json: company, status: 201
    end

    def index
      companies = Company.all
      render json: companies, status: 200
    end

    def show
      company = Company.find(params[:id])

      render json: company, status: 200
    end

    def destroy
      binding.pry
      company = Company.find(params[:id])
      company.destroy

      render body: nil, status: :no_content
    end

    private
    def company_params
      params.require(:company).permit(:name, :street, :city, :state, :zip_code, :industry, :lat, :lng)
    end
  end
end