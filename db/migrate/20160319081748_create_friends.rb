class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :first_user
      t.string :second_user
      t.string :integer

      t.timestamps
    end
  end
end
