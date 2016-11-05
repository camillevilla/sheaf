class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend

      t.timestamps
    end
  end
end
