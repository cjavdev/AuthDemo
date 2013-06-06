require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :username, :password
  
  def password=(password)
    # BCrypt docs at http://bcrypt-ruby.rubyforge.org/
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::base64(32)
    self.save!
    
    self.session_token
  end
end
