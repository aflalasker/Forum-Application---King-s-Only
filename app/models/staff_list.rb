class StaffList < ActiveRecord::Base
  validates_presence_of :email, maximum: 100 # Email is mandatory, maximum length is 100
  validates_uniqueness_of :email # Email is unique
end
