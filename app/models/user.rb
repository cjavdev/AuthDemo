class User < ActiveRecord::Base
  attr_accessible :username, :password_digest
  
  def verify_password(password)
    # Digest::SHA2.base64digest
  end
  
  def reset_session_token
    # SecureRandom::base64
  end
end
