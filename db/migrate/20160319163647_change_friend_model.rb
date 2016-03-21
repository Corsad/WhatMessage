class ChangeFriendModel < ActiveRecord::Migration
  def change
  		rename_column :friends, :first_user, :first_user_id
  		remove_column :friends, :second_user
  		add_column :friends, :second_user_id, :integer
  		remove_column :friends, :integer
  end
end
