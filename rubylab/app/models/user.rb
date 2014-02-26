class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_length_of :username, minimum: 3, maximum: 15
  validates_length_of :password, minimum: 4

  has_secure_password
end
