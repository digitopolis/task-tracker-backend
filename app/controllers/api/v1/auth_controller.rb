class Api::V1::AuthController < ApplicationController

	def create
	  @user = User.find_by(username: user_login_params[:username])
		if @user && @user.authenticate(user_login_params[:password])
			render json: { user: UserSerializer(@user) }, status: :accepted
		else
			render json: { message: 'Invalid username or password' }, status: :unauthorized
		end
	end

	private

	def user_login_params
	  params.require(:auth).permit(:username, :password)
	end
end
