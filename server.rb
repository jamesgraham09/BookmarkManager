require 'data_mapper'
require 'Sinatra'
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") #this is called a 'connection string'

require './lib/link' #telling the mapper where the database is, after the datamapper is initialised

DataMapper.finalize #finalise the models after declaring them

DataMapper.auto_upgrade! #tell datamapper to create the databases

set :root, File.dirname(__FILE__)

get '/' do
	@links = Link.all
	erb :index
end