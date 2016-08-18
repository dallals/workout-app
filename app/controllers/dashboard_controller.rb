class DashboardController < ApplicationController
  def index
  	@athletes = User.paginate(page: params[:page], per_page: 10).order(last_name: :asc)
  end
end
