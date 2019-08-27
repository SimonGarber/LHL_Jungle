class User < ActiveRecord::Base

has_secure_password
validates :name, presence: true
validates :email, presence: true, uniqueness: true 
validates :password, presence: true, length: {minimum: 5}

def self.authenticate_with_credentials(email, password)
  user = User.where('lower(email) = ?', email.downcase.strip).first
  if user && user.authenticate(password)
    user 
  else
    nil
  end
end
end
