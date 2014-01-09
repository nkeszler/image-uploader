class ImageUploader < Sinatra::Application

	post '/users/new' do
		@user = User.new(first_name: params[:first_name],
						  last_name: params[:last_name],
						  email: params[:email],
						  password: params[:password],
						  password_confirmation: params[:passwordc])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/')
		else
			redirect to('/')
		end
	end

	delete '/users/logout' do 
		session[:user_id] = nil
		redirect('/')
	end

	post '/users/session' do 
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user 
			session[:user_id] = user.id
			redirect to('/')
		else
			puts "log in failed"
			erb :home
		end
	end

end