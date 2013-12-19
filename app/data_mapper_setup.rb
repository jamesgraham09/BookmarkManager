env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") #this is called a 'connection string'

DataMapper.finalize #finalise the models after declaring them

DataMapper.auto_upgrade! #tell datamapper to create the databases