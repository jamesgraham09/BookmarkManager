require 'data_mapper'
require 'sinatra'
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") #this is called a 'connection string'

require './lib/link' #telling the mapper where the database is, after the datamapper is initialised
require './lib/tag'

DataMapper.finalize #finalise the models after declaring them

DataMapper.auto_upgrade! #tell datamapper to create the databases

set :root, File.dirname(__FILE__)

get '/' do
	@links = Link.all
	erb :index
end

post '/links' do
	url = params["url"]
	title = params["title"]
	tags = params["tags"].split(" ").map do |tag|
		Tag.first_or_create(:text => tag)
	end
	Link.create(:url => url, :title => title, :tags => tags)
	redirect to('/')
end

get '/tags/:text' do
	tag = Tag.first(:text => params[:text])
	@links = tag ? tag.links : []
	erb :index
end