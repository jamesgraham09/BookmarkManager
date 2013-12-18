ENV["RACK_ENV"] = 'test' #because we need to know which database to work with

require './server'
require 'capybara/rspec'
require 'sinatra'
require 'database_cleaner'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
	config.before(:suite) do
		DatabaseCleaner.strategy = :transaction
		DatabaseCleaner.clean_with(:truncation)
	end

	config.before(:each) do 
		DatabaseCleaner.start
	end
end



# Pasted in from Evegeny's Github (sites above config.before)
#  RSpec.configure do |config|
#   config.treat_symbols_as_metadata_keys_with_true_values = true
#   config.run_all_when_everything_filtered = true
#   config.filter_run :focus

#   # Run specs in random order to surface order dependencies. If you find an
#   # order dependency and want to debug it, you can fix the order by providing
#   # the seed, which is printed after each run.
#   #     --seed 1234
#   config.order = 'random'