#link class corresponds to a table in the database
class Link
	#makes instances of the link class datamapper resources
	#then describe the resources out model will have
	include DataMapper::Resource
	property :id, Serial
	property :title, String
	property :url, String
end