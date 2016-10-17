class CreateFriendrequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friendrequests do |t|
      t.references :sender
      t.references :recipient
      # request status codes: 0 - pending, 1 - accepted, 2 - rejected, 3 - blocked
      t.integer :status

      t.timestamps
    end
  end
end
