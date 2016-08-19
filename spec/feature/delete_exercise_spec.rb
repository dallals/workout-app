require "rails_helper"

RSpec.feature "Deleting Exercise" do 
	before do 
		@owner = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
		@owner_exer = Exercise.create(duration_in_min: 45, workout_type: "running",
			workout_date: Date.today, 
			calories_burned: 300, 
			calories_eaten: 1200, 
			weight: 200, user_id: @owner) 
		login_as(@owner)
	end
	scenario "delete exercise valid data" do
    visit "/"
    click_link "My Lounge"
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click
    
		expect(page).to have_content("Exercise was successfully destroyed.")
	end

end