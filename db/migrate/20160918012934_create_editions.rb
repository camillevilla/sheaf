class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.references :work, foreign_key: true
      t.references :publisher, foreign_key: true
      t.integer :publication_year
      t.integer :format # 0 - print, 1 - digital
      t.string :isbn10
      t.string :isbn13

      t.timestamps
    end
  end
end
