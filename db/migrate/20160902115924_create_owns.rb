class CreateOwns < ActiveRecord::Migration
  def change
    create_table :owns do |t|
      t.references :user, null: false
      t.references :publication, null: false
      t.date :acquisition_date
    end
  end
end
