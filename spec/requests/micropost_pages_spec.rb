require 'spec_helper'

describe "MicropostPages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { valid_signin user }

	describe "micropost creation" do
		before { visit root_path }

		describe "with invalid information" do
			it "should not create a micropost" do
				expect { click_button "Post" }.should_not change(Micropost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end

			describe "with valid information" do

				before { fill_in 'micropost_content', with: "Lorem ipsum" }
				it "should create a micropost" do
					expect { click_button "Post" }.should change(Micropost, :count).by(1)
				end
			end
		end
	end

	describe "micropost destruction" do
		let(:wrong_user) {FactoryGirl.create(:user)}
		before {FactoryGirl.create(:micropost, user: user)}

		describe "as correct user" do
			before { visit root_path }

			it "should delete a micropost" do
				expect {click_link "delete"}.should change(Micropost, :count).by(-1)
			end
		end

		describe "as wrong user" do
			before { visit user_path(wrong_user)}
			it {should_not have_link('delete')}
		end
	end
end
