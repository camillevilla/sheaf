class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.references :user
      t.references :own
      t.date :checkout_date
      t.date :return_date
    end
  end
end
