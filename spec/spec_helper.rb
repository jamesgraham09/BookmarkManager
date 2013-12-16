ENV["RACK_ENV"] = 'test' #because we need to know which database to work with

require './server'
require 'capybara/rspec'
require 'sinatra'
