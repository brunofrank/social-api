class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 100
      t.string :username, null: false, limit: 50

      t.timestamps
    end
  end
end
