class User < ActiveRecord::Base
    
    has_secure_password
    
    has_and_belongs_to_many :categories
    
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    
    def name 
        "#{first_name} #{last_name}"
    end
                           
end
