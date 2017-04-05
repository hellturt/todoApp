class TasksController < ApplicationController
	before_action :find_task, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@to_do = current_user.tasks.where(state: "to_do").order('updated_at DESC')
		@doing = current_user.tasks.where(state: "doing").order('updated_at DESC')
		@done = current_user.tasks.where(state: "done").order('updated_at DESC')
	end

	def show
	end

	def new
		@task = current_user.tasks.build
	end

	def create
		@task = current_user.tasks.build(task_params)
		@task.save
		redirect_to @task
	end

	def edit
	end

	def update
		@task.update(task_params)
		redirect_to @task
	end

	def destroy
		@task.destroy
		redirect_to tasks_path
	end


	private

	def find_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:content, :state)
	end
end