class AddUserToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :user_id, :integer
    add_index :favorites, :user_id
  end
end
