class ImageUploader < Sinatra::Application

	get '/' do
		if session[:user_id]
			@user = User.first(id: session[:user_id])
		end
		erb :home
	end

end