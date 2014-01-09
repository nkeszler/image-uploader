class ImageUploader < Sinatra::Application

	def make_paperclip_mash(file_hash)
		mash = Mash.new
		mash['tempfile'] = file_hash[:tempfile]
		mash['filename'] = file_hash[:filename]
		mash['content_type'] = file_hash[:type]
		mash['size'] = file_hash[:tempfile].size
		mash
	end

	get '/images/upload' do 
		erb :"images/upload"
	end

	post '/images/upload' do 
		user = User.first(id: session[:user_id])
		picture = Photo.new(:picture => make_paperclip_mash(params[:picture]),
							:user => user)
		#user.photos << picture
		halt "No Worky" unless picture.save
		redirect('/')
	end

end