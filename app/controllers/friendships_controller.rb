class FriendshipsController < ApplicationController
	before_action :authenticate_user!


	def create
		friend = User.find(params[:friend_id])

		# Friendship.create(friendship_params.merge!(friend_id: params[:friend_id],
		# 	user_id: current_user.id)) unless current_user.follows_or_same?(friend)
		# the above way is a better implimentation below works too.

		friendship = Friendship.new(friendship_params)
		friendship.friend_id = params[:friend_id]
		friendship.user_id = current_user.id

		if current_user.follows_or_same?(friend)
			flash[:danger] = "Friend wasnt create please try again"
			redirect_to root_path	
		else
			friendship.save 
			flash[:success] = "Friend was created"
			redirect_to root_path
		end	
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		# @friendship = Friendship.where(user_id: params[:id], friend_id: friend)
		# @friendship.destroy
		# redirect_to root_path
		if @friendship.destroy
      flash[:success] = "#{@friendship.friend.full_name} unfollowed"
    else
      flash[:danger] = "#{@friendship.friend.full_name} could not be unfollowed"
    end
    redirect_to user_exercises_path(current_user)
	end

	def show
		@friend = Friendship.find(params[:id]).friend
    @exercises = @friend.exercises.all
	end

 private

 def friendship_params
 	params.permit(:friend_id, :user_id)
 end

end