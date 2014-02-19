require 'digest/sha1'

class User < ActiveRecord::Base

  def self.authenticate(email, password)
    if user = User.where(email: email).first
        user.password == password
      "You typed in the right password"
    else
      "you did not type in the right password"
    end
  end

  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end

end
