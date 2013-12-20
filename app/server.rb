require 'data_mapper'
require 'sinatra'
require 'rack-flash'

require './lib/link' #telling the mapper where the database is, after the datamapper is initialised
require './lib/user'
require './lib/tag'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'controllers/application'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/users'

set :root, File.dirname(__FILE__)

enable :sessions
set :session_secret,"test"
use Rack::Flash

