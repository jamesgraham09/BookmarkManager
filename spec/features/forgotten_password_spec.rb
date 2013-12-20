require 'spec_helper'

feature "user resets password" do

	before(:each) do
		User.create(:email => "test@test.com",
					:password => "test",
					:password_confirmation => "test")
	end

	scenario "gets re-entry prompt" do
		visit '/sessions/new'
		click_button 'forgotten password'
		expect(page).to have_content("please enter your email")
	end

	scenario "gets re-entry prompt" do
		generate_password_token
		expect(User.first.password_token).to_not eq(nil)
	end

	scenario "resets password" do
		generate_password_token
		visit "/users/reset_password/"+"#{User.first.password_token}"
		fill_in 'password', :with => 'test'
		fill_in 'password_confirmation', :with => 'test'
		click_button 'submit'
		expect(page).to have_content("your password has been reset")
	end

	def generate_password_token
		visit '/password/reset'
		fill_in 'email', :with => 'test@test.com'
		click_button 'submit'
	end
end