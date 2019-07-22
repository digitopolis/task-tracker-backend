class Api::V1::TasksController < ApplicationController
	before_action :find_task, only: [:show]

	def index
	  @tasks = Task.all
		render json: @tasks
	end

	def show
	  render json: @task
	end

	private

	def task_params
	  params.require(:task).permit(:name, :goal, :user_id)
	end

	def find_task
	  @task = Task.find(params[:id])
	end
end
