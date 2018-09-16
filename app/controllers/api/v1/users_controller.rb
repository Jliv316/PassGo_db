module Api::V1
  class UsersController < ApplicationController
    def create
      user = User.create(user_params)
      render user, status: 201
    end

    def show
      user = User.find_by(token: params[:user][:token])
      render user, status: 200
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :token)
    end
  end
end