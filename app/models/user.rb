class User < ActiveRecord::Base
  validates_presence_of :first_name, maximum: 25 # First name is mandatory, maximum length is 25
  validates_presence_of :last_name, maximum: 50 # Last name is mandatory, maximum length is 50
  validates_presence_of :email, maximum: 100 # Email is mandatory, maximum length is 100
  validates_presence_of :role # Role is mandatory
  validates_uniqueness_of :email # Emails must be unique
end
