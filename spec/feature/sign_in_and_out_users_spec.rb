
require "rails_helper"

RSpec.feature "Users signin" do 
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com",
                          password: "password") 
  end
    
  scenario "with valid credentials" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: @john.email 
    fill_in "Password", with: @john.password 
    click_button "Sign in"
    
    expect(page).to have_content("Signed in successfully.")
    # expect(page).to have_content("Signed in as #{@john.email}") 
  end
  scenario "Sign Out User" do 
		login_as(@john)
		visit "/"
		click_link "Sign Out"
		expect(page).to have_content("Signed out successfully.")
		expect(current_path).to eq(root_path)
	end
end