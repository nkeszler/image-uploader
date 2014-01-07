require 'sinatra'
require 'data_mapper'

require_relative './routes/init'

class ImageUploader < Sinatra::Application

end

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/image_uploader_app_#{env}")

require_relative './models/init'

DataMapper.finalize
DataMapper.auto_upgrade!