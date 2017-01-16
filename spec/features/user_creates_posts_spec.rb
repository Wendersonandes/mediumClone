require "rails_helper"

RSpec.describe "Creating posts" do
	scenario "successfully" do
		visit root_path
		click_on "Write a story"
		fill_in "Title",	:with => "My first beautifull post"
		fill_in "Body",		:with => "My awesome content made with heart in heaven"

		click_on "Publish"

		expect(page).to have_content "My first beautifull post"
	end

	scenario "unsuccessfully" do
		visit root_path
		click_on "Write a story"

		fill_in "Title",	:with => "My second story"
		fill_in "Body",		:with => ""
		click_on "Publish"

		expect(page).to have_css ".error"
	end
end
