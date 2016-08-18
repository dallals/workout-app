class ExercisesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_exercise, except: [:index, :new, :create]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	def index
		@exercises = current_user.exercises.all
		# @exercises = Exercise.where(user_id: current_user) 
	end

	def new
		@exercise = current_user.exercises.new 
		# @exercise = Exercise.where(user_id: current_user).order(created_at: :desc)
	end

	def show
	end

	def edit

	end

	def update
    	if @exercise.update(exercise_params)
    		flash[:success] = "Exercise was successfully updated"
    		redirect_to [current_user, @exercise]
    	else
    		flash.now[:danger] = "Exercise has not been updated"
    		render :edit
      end	
	end

	def create


		@exercise = current_user.exercises.new(exercise_params)

		if @exercise.save
			flash[:success]= "Exercise has been created"
			redirect_to [current_user, @exercise]
		else
			flash.now[:danger] = "Exercise has not been created"
			render :new
		end
	end

  def destroy
    @exercise.destroy 
    respond_to do |format|
      format.html { redirect_to user_exercises_path(current_user), notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	private

	def exercise_params
  	params.require(:exercise).permit(:duration_in_min, :workout_type, :workout_date, :calories_burned, :calories_eaten, :weight, :user_id)
  end

  def require_same_user
  	if @exercise.user != current_user
      flash[:danger] = "You can only edit your own workouts."
      redirect_to root_path
    end
  end

  def set_exercise
  	# @exercise = Exercise.find(params[:id])
  	@exercise = current_user.exercises.find(params[:id])
  end
end
