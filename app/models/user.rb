require 'bcrypt'

class User

	include DataMapper::Resource

	validates_confirmation_of :password, message: "Passwords don't match"
	validates_uniqueness_of :email, message: "This email is already in use"

	property :id, Serial
	property :email, String, unique: true, message: "This email is already in use"
	property :password_digest, Text

	attr_reader :password
	attr_accessor :password_confirmation

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email,password)
		user = User.first(email: email)
		user && BCrypt::Password.new(user.password_digest) == password ? user : nil
	end

end