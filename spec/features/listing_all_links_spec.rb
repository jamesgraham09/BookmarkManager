require 'spec_helper.rb'

feature "user browses the list of links" do
	before (:each) {
		Link.create(:url => "http://www.makersacademy.com",
					:title => "Makers Academy")
		}

		scenario "when opening the home page" do
			visit "/"
			expect(page).to have_content("Makers Academy")
		end
end