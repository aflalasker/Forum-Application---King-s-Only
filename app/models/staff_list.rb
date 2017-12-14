class StaffList < ActiveRecord::Base
  validates_presence_of :email, maximum: 100
  validates_uniqueness_of :email
end
