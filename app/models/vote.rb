class Vote < ActiveRecord::Base
  belongs_to :post # A vote belongs to a post
  validates_presence_of :post_id # Post id is mandatory
  validates_presence_of :user_id # User id is mandatory
  validates_presence_of :score # Score is mandatory
  validates :user_id, uniqueness: { scope: :post_id } # User id and post id have to be unique together (users cannot vote the same post twice)
end
