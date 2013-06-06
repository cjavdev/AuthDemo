class User < ActiveRecord::Base
  attr_accessible :username, :password
  
  def password=(password)
    self.password_digest = Digest::SHA2.base64digest(password)
  end
  
  def verify_password(password)
    self.password_digest == Digest::SHA2.base64digest(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::base64(32)
    self.save!
    
    self.session_token
  end
end
