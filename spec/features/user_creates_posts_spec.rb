require "rails_helper"

RSpec.describe "Creating posts" do
	let(:user) {create(:user) }
	scenario "successfully" do
		sign_in user
		visit root_path
		click_on "Write a story"
		fill_in "Title",	:with => "My first beautifull post"
		fill_in "Body",		:with => "My awesome content made with heart in heaven"

		click_on "Publish"

		save_and_open_page

		within(".posts") do
			expect(page).to have_content "My first beautifull post"
			expect(page).to have_content user.username 
			expect(page).to have_content "My awesome content made with heart in heaven"
		end
	end

	scenario "unsuccessfully" do
		sign_in user
		visit root_path
		click_on "Write a story"

		fill_in "Title",	:with => "My second story"
		fill_in "Body",		:with => ""
		click_on "Publish"

		expect(page).to have_css ".error"
	end
	scenario "non-logged in user cannot create posts" do
		visit root_path
		click_on "Write a story"

		expect(current_path).to eq(new_user_session_path)
	end
end
