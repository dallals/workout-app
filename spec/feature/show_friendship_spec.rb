require "rails_helper"


RSpec.feature "Showing Friend Workout" do 

	before do 
		@john = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
		@sarah = User.create(first_name: "Sarah", last_name: "Dow", email: "sarah@example.com", password: "password")
		
		@e1 = @john.exercises.create(duration_in_min: 20, workout_type: "running", workout_date: Date.today)
		@e2 = @sarah.exercises.create(duration_in_min: 20, workout_type: "weight lefting", workout_date: Date.today)
		login_as(@john)

		@following = Friendship.create(user: @john, friend: @sarah)
	end
		scenario "show friends workouts" do
			visit "/"
			click_link "My Lounge"
			click_link @sarah.full_name
			expect(page).to have_content(@sarah.full_name)
			# expect(page).to have_css("div#chart")
			expect(page).to have_content("weight lefting")

		end
end