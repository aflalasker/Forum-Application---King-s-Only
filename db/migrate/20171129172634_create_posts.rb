class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer 'topic_id'
      t.integer 'user_id'
      t.text 'content', limit: 10000
      t.integer 'respect'
      t.timestamps
    end
    add_index('posts', 'topic_id')
    add_index('posts', 'user_id')
  end

  def down
    drop_table :posts
  end
end
