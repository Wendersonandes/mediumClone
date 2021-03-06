require 'rails_helper'

RSpec.feature "User signing in" do
	background do
		@user = create(:user) 
	end
	scenario "successfully" do
		sign_in @user	
		expect(page).to have_content @user.email
	end
	scenario "unsuccesfully" do
		visit new_user_session_path
		fill_in "Email", :with => "wrongemail@emerge.art.br"
		fill_in "Password", :with => "wrongPassword"
		click_on "Log in"

		expect(page).not_to have_content @user.email
	end
end
