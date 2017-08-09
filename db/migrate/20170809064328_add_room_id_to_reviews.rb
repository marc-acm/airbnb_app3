class AddRoomIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :room_id, :integer
  end
end
