require 'rails_helper'

RSpec.describe User do
	describe "following and unfollowing other users" do

		let(:luke) {create(:user, :username => "Luke Skywalker")}
		let(:solo) {create(:user, :username => "Hans Solo")}

		it "adds relationships between the two users" do
			luke.follow(solo)
			expect(luke.following?(solo)).to be_truthy
			expect(solo.followers).to include(luke)

			luke.unfollow(solo)
			expect(luke.following?(solo)).to be_falsy
			expect(solo.followers).not_to include(luke)
		end
	end
end
