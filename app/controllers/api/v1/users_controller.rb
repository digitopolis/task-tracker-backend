class Api::V1::UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
	  @users = User.all
		render json: @users
	end

	def show
	  render json: UserSerializer.new(@user).serialized_json
	end

	def new
	  @user = User.new
	end

	def create
	  @user = User.create(user_params)
		if @user.valid?
			@token = encode_token(user_id: @user.id)
			render json: { user: UserSerializer(@user), jwt: @token }, status: :created
		else
			render json: { error: 'failed to register new user' }, status: :not_acceptable
		end
	end

	private

	def user_params
	  params.permit(:name, :username, :password)
	end

	def find_user
	  @user = User.find(params[:id])
	end
end
