module Api::V1
  class UsersController < ApplicationController
    def create
      user = User.create(user_params)
      render json: user, status: 201
    end

    def index
      users = User.all
      render json: users, status: 200
    end

    def show
      user = User.find_by(token: params[:id])
      render json: user, status: 200
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :token)
    end
  end
end