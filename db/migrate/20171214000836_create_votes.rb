class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer 'post_id'
      t.integer 'user_id'
      t.integer 'score'
      t.timestamps null: false
    end
    add_index 'votes', %w[post_id user_id], unique: true
  end
end
