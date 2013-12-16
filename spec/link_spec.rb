require 'spec_helper'
require './lib/link.rb'

	describe Link do
		context "Demonstration of how datamapper works" do
			it " " do
				# Note that this is a 'fake' test to get used to the syntax
				expect(Link.count).to eq(0)
				Link.create(:title => "Makers Academy",
					:url => "http://www.makersacademy.com/")
				expect(Link.count).to eq(1)
				link = Link.first
				expect(link.url).to eq("http://makersacademy.com")
				expect(link.title).to eq("Makers Academy")
				link.destroy
				expect(Link.count).to eq(0)
			end
		end
	end


