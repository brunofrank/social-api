class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end

    add_index :connections, :follower_id
    add_index :connections, :followed_id
    add_index :connections, %i[follower_id followed_id], unique: true
  end
end
