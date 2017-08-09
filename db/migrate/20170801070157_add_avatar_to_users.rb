class AddAvatarToUsers < ActiveRecord::Migration[5.1]
  #def change
   #  add_column :users, :avatar, :string
  #end

  def up
    add_attachment :users, :avatar
  end
 
  def down
    remove_attachment :users, :avatar
  end

end
