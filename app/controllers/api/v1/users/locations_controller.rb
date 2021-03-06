class Api::V1::Users::LocationsController < ApplicationController
  
    skip_before_action :verify_authenticity_token
    def create
      user = User.find_by(token: params[:user_id])
      companies = Company.all
      user_location = params[:location]
      companies.each do |company|
        user.check_for_points(user, user_location, company)
      end
      render json: user, status: 200
    end
end