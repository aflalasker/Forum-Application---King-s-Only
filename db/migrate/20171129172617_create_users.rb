class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string 'first_name', limit: 25
      t.string 'last_name', limit: 50
      t.string 'email', default: '', null: false, limit: 100
      t.integer 'role'
      t.timestamps
    end
    add_index 'users', ['email'], unique: true
  end

  def down
    drop_table :users
  end
end
