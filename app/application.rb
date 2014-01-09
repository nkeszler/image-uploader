require 'sinatra'
require 'data_mapper'
require 'dm-paperclip'
require 'aws-sdk'

require_relative './routes/init'

class ImageUploader < Sinatra::Application

	enable :sessions
	set :sesion_secret, 'super_secret'

end

def current_user
	@current_user ||= User.get(session[:user_id]) if session[:user_id]
end

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/image_uploader_app_#{env}")

require_relative './models/init'

DataMapper.finalize
DataMapper.auto_upgrade!