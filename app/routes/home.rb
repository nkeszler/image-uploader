class ImageUploader < Sinatra::Application

	get '/' do 
		erb :home
	end

end