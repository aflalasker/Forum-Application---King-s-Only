class StaffList < ActiveRecord::Base
    validates_uniqueness_of :email
end
