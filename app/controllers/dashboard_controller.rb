class DashboardController < ApplicationController

	
  def index
  	@athletes = User.paginate(page: params[:page], per_page: 5).order(last_name: :asc)
  	@workout = Exercise.where(user_id: current_user).last
  end

  def search
  	@athletes = User.search_by_name(params[:search_name]).paginate(:page => params[:page])
  end
end
