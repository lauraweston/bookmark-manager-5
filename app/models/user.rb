require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :encrypted_password, Text


  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password)
  end
end
