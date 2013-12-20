require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
	Datamapper.auto_upgrade!
	puts "Auto_upgrade complete(no data loss)"
end

task :auto_migrate do
	DataMapper.auto_migrate!
	puts "Auto_migrate complete (data may have been lost)"
end