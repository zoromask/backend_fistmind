require 'bcrypt'

class User < ApplicationRecord
	# has_secure_password
	before_save { self.password = User.digest(password) }
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
	# Returns the hash digest of the given string.
	def User.digest(string)
		BCrypt::Password.create(string)
	end
	def User.digest2(hash_string)
		BCrypt::Password.new(hash_string)
	end
end
