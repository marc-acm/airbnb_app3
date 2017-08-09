class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :rating_id
      t.string :host

      t.timestamps
    end
    add_index :rooms, [:user_id, :created_at]
  end
end
