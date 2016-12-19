class CreateCopies < ActiveRecord::Migration[5.0]
  def change
    create_table :copies do |t|
      t.references :user, foreign_key: true
      t.date :acquisition_date
      t.string :url 
      t.references :edition, foreign_key: true
      t.references :format, foreign_key: true
      
      t.timestamps
    end
  end
end
