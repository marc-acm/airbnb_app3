class AddLongitudeToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :longitude, :float
  end
end
