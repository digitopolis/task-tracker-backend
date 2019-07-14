class Api::V1::UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
	  @users = User.all
		render json: @users
	end

	def show
	  render json: @user
	end

	private

	def user_params
	  params.require(:user).permit(:name, :username, :password)
	end

	def find_user
	  @user = User.find(params[:id])
	end
end
