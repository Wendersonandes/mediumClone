require 'rails_helper'

RSpec.feature "User visits home page" do
	scenario "succefully and sees a logo" do
		visit root_path
		expect(page).to have_content "My Medium Clone"
	end
end
