class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :copy, foreign_key: true
      t.integer :status_code # 0:pending, 1:out, 2:returned
      t.date :checkout_date
      t.date :return_date

      t.timestamps
    end
  end
end
