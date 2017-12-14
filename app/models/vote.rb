class Vote < ActiveRecord::Base
    belongs_to :post
    validates_presence_of :post_id
    validates_presence_of :user_id
    validates_presence_of :score
    validates :user_id, uniqueness: { scope: :post_id }
end
