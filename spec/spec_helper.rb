ENV["RACK_ENV"] = 'test' #because we need to know which database to work with

require './server'
require 'capybara/rspec'
require 'sinatra'
require 'database_cleaner'

RSpec.configure do |config|
	config.before(:suite) do
		DatabaseCleaner.strategy = :transaction
		DatabaseCleaner.clean_with(:truncation)
	end

	config.before(:each) do 
		DatabaseCleaner.start
	end
end