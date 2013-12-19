require 'data_mapper'
require 'sinatra'

require './lib/link' #telling the mapper where the database is, after the datamapper is initialised
require './lib/user'
require './lib/tag'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

set :root, File.dirname(__FILE__)

enable :sessions
set :session_secret,"test"

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

get '/users/new' do
	erb :"users/new"
end

post '/users' do
	user = User.create(:email => params[:email],
					:password => params[:password],
					:password_confirmation => params[:password_confirmation])
	session[:user_id] = user.id
	redirect to('/')
end