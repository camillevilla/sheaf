class CreateBorrows < ActiveRecord::Migration
  def change
    create_table do |t|
      t.references :user
      t.references :copy
      t.date :checkout_date
      t.date :return_date
    end
  end
end
