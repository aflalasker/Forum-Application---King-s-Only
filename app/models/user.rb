class User < ActiveRecord::Base
  validates_presence_of :first_name, maximum: 25
  validates_presence_of :last_name, maximum: 50
  validates_presence_of :email, maximum: 100
  validates_presence_of :role
  validates_uniqueness_of :email
end
