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
    puts password
    hash_password = Digest::SHA1.hexdigest(password)
    puts hash_password
    hash_password
  end

end
