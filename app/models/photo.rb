class Photo

	include DataMapper::Resource
	include Paperclip::Resource

	property :id, Serial

	belongs_to :user

	has_attached_file :picture,
					  :url => "/system/:attachment/:id/:style/:basename.:extension",
					  :path => "/Users/Nicki/Projects/image-uploader/public/system/:attachment/:id/:style/:basename.:extension"

end