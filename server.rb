env = ENV["RACK_ENV"] || "development"
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") #this is called a 'connection string'

require './lib/link.rb' #telling the mapper where the database is, after the datamapper is initialised

DataMapper.finalize #finalise the models after declaring them

DataMapper.auto_upgrade! #tell datamapper to create the databases

