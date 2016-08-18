class ExercisesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_exercise, except: [:index, :new, :create]
	def index
		@exercises = current_user.exercises.all 
	end

	def new
		@exercise = current_user.exercises.new 
		# @exercise = Exercise.where(user_id: current_user).order(created_at: :desc)
	end

	def show
	end

	def create
		@exercise = current_user.exercises.new(exercise_params)

		if @exercise.save
			flash[:success]= "Exercise has been created"
			redirect_to [current_user, @exercise]
		else
			flash[:danger] = "Exercise has not been created"
			render :new
		end
	end

	private

	def exercise_params
  	params.require(:exercise).permit(:duration_in_min, :workout_type, :workout_date, :calories_burned, :calories_eaten, :weight, :user_id)
  end

  def set_exercise
  	# @exercise = Exercise.find(params[:id])
  	@exercise = current_user.exercises.find(params[:id])
  end
end
