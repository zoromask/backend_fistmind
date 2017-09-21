require 'bcrypt'

class User < ApplicationRecord
	# has_secure_password
	# before_save { self.password = User.digest(username) }
	# def authenticate(password)
	# 	if self.password == password
	# 		self
	# 	else
	# 		nil
	# 	end
	# end
	# def encrypt_password
	# 	if password.present?
	# 		self.password_salt = BCrypt::Engine.generate_salt
	# 		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	# 	end
	# end
	# # Returns the hash digest of the given string.
	# def User.digest(string)
	# 	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	# 	BCrypt::Password.create(string, cost: cost)
	# end
end
