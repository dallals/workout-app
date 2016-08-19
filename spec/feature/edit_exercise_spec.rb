require 'rails_helper'


RSpec.feature "Editing Exercises" do 
	before do 
		@owner = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
		@owner_exer = Exercise.create(duration_in_min: 45, workout_type: "running", workout_date: Date.today, calories_burned: 300, calories_eaten: 1200, weight: 200, user_id: @owner) 
		login_as(@owner)
	end

	scenario "edit exercise valid data" do
		visit "/"
		click_link "My Lounge"
		link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
		find(link).click
		fill_in "Current Weight", with: 150
		click_button "Update Exercise"

		expect(page).to have_content("Exercise was successfully updated")
		expect(page).to have_content(150)
		expect(page).not_to have_content(200)

	end

end
